module S3Helper
  def s3_presigned_url(bucket, key, expires_in = 3600)
    signer = Aws::S3::Presigner.new(client: S3_CLIENT)
    signer.presigned_url(:get_object, bucket: bucket, key: key, expires_in: expires_in)
  end
end