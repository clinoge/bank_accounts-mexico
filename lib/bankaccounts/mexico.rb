require "bankaccounts/mexico/version"
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

    def find_bank_by_account_number(account_number)
      bank_data.find do |bank|
        account_number.starts_with? bank.abm_number
      end
    end

    def find_bank_by_pattern_fuzzy(pattern)
      bank_data.find do |bank|
        pattern.match(bank.short_name) or pattern.match(bank_full_name)
      end
    end

    def find_bank_by_pattern_short_name(pattern)
      bank_data.find do |bank|
        pattern.match(bank.short_name)
      end
    end

    def find_bank_by_pattern_full_name(pattern)
      bank_data.find do |bank|
        pattern.match(bank.full_name)
      end
    end
  end
end
