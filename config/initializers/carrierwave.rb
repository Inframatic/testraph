CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJBLPKVIOIWM6S2QQ',
    :aws_secret_access_key  => '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'
  }
  config.fog_directory  = "vividaura"
end