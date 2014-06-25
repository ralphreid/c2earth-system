Geocoder.configure(
  lookup: :bing,
  api_key: Figaro.env.bing_maps_REST_services_key,
  timeout: 10
)
