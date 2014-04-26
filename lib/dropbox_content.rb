
require 'open-uri'
require 'csv'
require "awesome_print"

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
  # strip https://www.dropbox.com from dropbox url
  dropbox_path = @dropbox_url.at(0..10)
  ap dropbox_path
  # generate download url
  # @dropbox_download_url = "https://dl.dropboxusercontent.com/#{dropbox_path}"
  # puts @dropbox_download_url
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


