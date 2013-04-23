require 'aws-sdk'
require 'dynamoid'

database_name = case Padrino.env
  when :development then 'laputa_development'
  when :production  then 'laputa_production'
  when :test        then 'laputa_test'
end


AWS.config({
	:access_key_id      => 'AKIAJOIYEDG6GZ5MAJGQ',
	:secret_access_key  => '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',
	:dynamo_db_endpoint => 'dynamodb.ap-northeast-1.amazonaws.com'
})

Dynamoid.configure do |config|
	config.adapter = 'aws_sdk' # This adapter establishes a connection to the DynamoDB servers using Amazon's own AWS gem.
	config.namespace = database_name # To namespace tables created by Dynamoid from other tables you might have.
	config.warn_on_scan = true # Output a warning to the logger when you perform a scan rather than a query on a table.
	config.partitioning = true # Spread writes randomly across the database. See "partitioning" below for more.
	config.partition_size = 200  # Determine the key space size that writes are randomly spread across.
	config.read_capacity = 10 # Read capacity for your tables
	config.write_capacity = 5 # Write capacity for your tables
end
