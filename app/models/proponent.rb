class Proponent < ApplicationRecord
  include TaxHelper

  validates_uniqueness_of :identification_document, case_sensitive: false

  def inss_tier
    inss_tax_brackets.each do |limits, percentage|
      lower_bound, higher_bound = limits

      if monthly_salary < higher_bound
        return limits
      end
    end

    inss_tax_brackets.keys.last
  end
end

