# require 'csv'

# projects = CSV.read(open('data.txt'))

# projects.each

require 'open-uri'

class DropboxContent
  # constructor method
  def initialize(dropbox_url_download, header_present)
    @dropbox_url_download, @header_present = dropbox_url_download, header_present
  end
  
  # setter methods

  # get file from drop box
  def set_dropbox_content
    
  end
  
end





dropbox_contents = open("https://dl.dropboxusercontent.com/sh/sl727ql5hyffqn5/FhptN8NQu3/ProjectManagers.txt?dl=1") {|f| f.read }



# take any file & prepare it to be consumed

# find the headers in the file

# checks to see if there are headers in the file

# grabs the file contents

# turns the contents into an array

# removes the header row from the array (assume first record)

# converts the array into an array of arrays

# makes the object ready for consumption
