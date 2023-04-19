require 'aws-sdk-s3'

Aws.config.update({
  region: ENV['AWS_REGION'],
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY'], ENV['AWS_CODE'])
})

S3_CLIENT = Aws::S3::Client.new
