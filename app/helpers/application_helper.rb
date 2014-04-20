module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | C2earthSystem"      
    end
  end
end
