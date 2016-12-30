use Mix.Config

config :exvcr, [
  filter_sensitive_data: [
    [pattern: "Bearer [0-9a-z]+", placeholder: "<<access_key>>"]
  ],
  filter_url_params: false,
  filter_request_headers: ["auth"],
  response_headers_blacklist: ["Set-Cookie", "X-Request-Id"]
]

config :slippers, tenkft_endpoint: "https://vnext-api.10000ft.com/api/v1/"

if File.exists?("config/test.secret.exs") do
  import_config "test.secret.exs"
end
