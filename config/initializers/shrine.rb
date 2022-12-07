require 'shrine'
if Rails.env.development? || Rails.env.production?
  require "shrine/storage/s3"
  s3_options = {
    access_key_id:     Rails.application.credentials.aws.s3_access_key_id,
    secret_access_key: Rails.application.credentials.aws.s3_secret_access_key,
    region:            Rails.application.credentials.aws.region,
    bucket:            Rails.application.credentials.aws.bucket,
  }

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
    store: Shrine::Storage::S3.new(prefix: "store", **s3_options)
  }
elsif Rails.env.test?
  require 'shrine/storage/memory'
  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
end
Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for retaining cached file on form redisplays
Shrine.plugin :restore_cached_data    # refresh metadata for cached files
Shrine.plugin :presign_endpoint, presign_options: -> (request) {
  # Uppy will send the "filename" and "type" query parameters
  filename = request.params["filename"]
  type     = request.params["type"]

  {
    content_disposition:    ContentDisposition.inline(filename), # set download filename
    content_type:           type,                                # set content type (defaults to "application/octet-stream")
    content_length_range:   0..(10*1024*1024),                   # limit upload size to 10 MB
  }
}
