[ ![Codeship Status for ralphreid/c2earth-system](https://www.codeship.io/projects/83eccdc0-f23e-0131-8cdf-3a452d4b28f8/status)](https://www.codeship.io/projects/27673)

== README

This README would normally document whatever steps are necessary to get the application up and running.

Things you may want to cover:

- Ruby version
- System dependencies
- Configuration
- Database creation
- Database initialization
- How to run the test suite
- Services (job queues, cache servers, search engines, etc.)
- Deployment instructions
- ...

Figaro Configuration
====================

Remember to updated the config file as follows:<pre># config/application.yml<br> google_maps_v3_api_key: "put your key here" bing_maps_REST_services_key: "put your key here"</pre> Head to https://github.com/laserlemon/figaro for more information.

Not currently using Figaro. Check https://github.com/maoueh/nugrant#method-2

in Host<pre>vagrant user env --format script</pre>

in Guest<pre>. nugrant2env.sh</pre>
