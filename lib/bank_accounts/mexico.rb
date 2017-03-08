require "bank_accounts/mexico/version"
require 'yaml'

module BankAccounts
  module Mexico
    extend self

    def root_dir
      spec = Gem::Specification.find_by_name("bankaccounts-mexico")
      spec.gem_dir
    end

    def bank_data
      ::YAML.load(File.open(File.join(root_dir, "data", "banks.yml")))
    end

    def find_bank_by_bank_code(bank_code)
      bank_data.find do |bank|
        bank["abm_number"] == bank_code
      end
    end

    def find_bank_by_account_number(account_number)
      find_bank_by_bank_code(bank_code_of(account_number))
    end

    def find_bank_by_pattern_fuzzy(pattern)
      bank_data.find do |bank|
        pattern.match(bank["short_name"]) or pattern.match(bank["full_name"])
      end
    end

    def find_bank_by_pattern_short_name(pattern)
      bank_data.find do |bank|
        pattern.match(bank["short_name"])
      end
    end

    def find_bank_by_pattern_full_name(pattern)
      bank_data.find do |bank|
        pattern.match(bank["full_name"])
      end
    end

    def bank_code_of(account_number)
      account_number[0..2]
    end

    def city_code_of(account_number)
      account_number[3..5]
    end

    def account_number_of(account_number)
      account_number[6...16]
    end

    def control_digit_of(account_number)
      account_number[-1]
    end

    def valid_account_number?(account_number)
      def weight(position)
        case position % 3
        when 0
          3
        when 1
          7
        when 2
          1
        end
      end

      return false unless find_bank_by_account_number(account_number)
      checksum = 0

      account_number[0..16].chars.map(&:to_i).each_with_index do |number, i|
        checksum += (number * weight(i)) % 10
      end

      return (10 - (checksum % 10)) % 10 == control_digit_of(account_number).to_i
    end
  end
end
