class Proponent < ApplicationRecord
  validates_uniqueness_of :identification_document, case_sensitive: false
end
