class Stakeholder < ActiveRecord::Base
  has_and_belongs_to_many :stakeholders  
end
