class Phase < ActiveRecord::Base
  belongs_to :project
  belongs_to :project_manager
end
