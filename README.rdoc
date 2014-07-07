== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.


Remember development dependency of http://www.railsbricks.net/
sudo gem install railsbricks

# Figaro Configuration
Remember to updated the config file as follows:
<pre># config/application.yml<br>
google_maps_v3_api_key: "put your key here"
bing_maps_REST_services_key: "put your key here"</pre>
Head to https://github.com/laserlemon/figaro for more information.
