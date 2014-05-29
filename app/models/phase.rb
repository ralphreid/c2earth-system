class Phase < ActiveRecord::Base
  belongs_to :project_manager
  belongs_to :investigation_type
end
