
require 'open-uri'
require 'csv'

class DropboxContent
  # constructor method
  def initialize(dropbox_url, header_present)
    @dropbox_url, @header_present = dropbox_url, header_present
  end
  
  # setter methods
  def set_dropbox_url=(value)
    @dropbox_url = value
  end

  def set_header_present=(value)
    @header_present = value
  end

  # accessor methods
  def get_dropbox_url
    @dropbox_url
  end

  def get_header_present
    @header_present
  end
  
  # instance methods

  def generate_dropbox_download_url
    # BUILD determine uri of drop box link
    dropbox_uri = 'bar'
    @dropbox_download_url = "https://dl.dropboxusercontent.com/#{dropbox_uri}"
    puts @dropbox_download_url
  end

  def get_array
    puts 'get_array'
  end

  def get_array_of_arrays
    puts 'get_array_of_arrays'
  end

  def find_headers
    puts 'find_headers'
  end

  def remove_header
    puts 'remove_header'
  end


  # Future Feature
  def check_for_headers
    
  end

end


test = DropboxContent.new("https://www.dropbox.com/sh/sl727ql5hyffqn5/-W3UJxiLVY", true)



