Geocoder.configure(
  lookup: :bing,
  key: Figaro.env.bing_maps_REST_services_key,
  :timeout => 5
)
