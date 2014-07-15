
require 'open-uri'
require 'csv'

class ArrayContent
# constructor method
  def initialize(url, header_present, type)
    @url = url
    @header_present = header_present
    @type = type
  end

  # setter methods
  def set_dropbox_url=(value)
    @url = value
  end

  def set_header_present=(value)
    @header_present = value
  end

  # accessor methods
  def get_dropbox_url
    @url
  end

  def get_header_present
    @header_present
  end

  def get_type
    @type
  end
  # instance methods

  def generate_dropbox_download_url
    # strip https://www.dropbox.com from dropbox url
    dropbox_path = @url.at(24..-1)
    dropbox_download_ending = '?dl=1'
    # generate download url
    "https://dl.dropboxusercontent.com/#{dropbox_path}#{dropbox_download_ending}"
  end

  def get_arr_of_arrs
    case @type
    when 'dropbox'
      data_table = open(generate_dropbox_download_url()) { |io| io.read }
    when 'local'
      path = "#{Rails.root}/seed_content/"
      file_path = path + @url
      data_table = open(file_path) { |io| io.read }
    end
    data_array = CSV.parse(data_table)
    data_array.drop(1) if @header_present
  end

  # Future Feature
  def check_for_headers

  end

end
