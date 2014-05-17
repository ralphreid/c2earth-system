class Company < ActiveRecord::Base
  has_many :stakeholders
  has_and_belongs_to_many :company_types
end
