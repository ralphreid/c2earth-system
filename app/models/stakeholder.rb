class Stakeholder < ActiveRecord::Base
  belongs_to :client_type
  belongs_to :company
  has_and_belongs_to_many :stakeholder_types
end
