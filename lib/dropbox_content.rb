
require 'open-uri'
require 'csv'

class DropboxContentSeed
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
    dropbox_path = @dropbox_url.at(24..-1)
    dropbox_download_ending = '?dl=1'
    # generate download url
    "https://dl.dropboxusercontent.com/#{dropbox_path}#{dropbox_download_ending}"
  end

  def get_arr_of_arrs
    data_table = open(generate_dropbox_download_url()) { |io| io.read }
    data_array = CSV.parse(data_table)
    data_array.drop(1) if @header_present
  end

  # Future Feature
  def check_for_headers
    
  end

end
