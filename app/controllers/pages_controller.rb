class PagesController < ApplicationController
  before_action :authenticate_user!, only: [
    :inside
  ]
  helper MapHelper

  def home
  end
  
  def inside
  end

  def map
  end

end
