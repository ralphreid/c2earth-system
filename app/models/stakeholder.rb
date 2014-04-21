class Stakeholder < ActiveRecord::Base
  belongs_to :client_type
  belongs_to :company
end
