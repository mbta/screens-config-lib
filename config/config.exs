import Config

config :screens_config,
  config_s3_bucket: "mbta-ctd-config"

import_config "#{Mix.env()}.exs"
