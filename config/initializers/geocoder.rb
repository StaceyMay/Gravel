Geocoder.configure(
  # Geocoding options
  lookup: :google,
  ip_lookup: :freegeoip,
  use_https: false,
  cache: Redis.new
)