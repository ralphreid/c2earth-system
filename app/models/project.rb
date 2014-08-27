class Project < ActiveRecord::Base
  has_many :phases
  has_many :activities
  has_many :sites, through: :activities
end
