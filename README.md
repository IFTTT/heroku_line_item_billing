# HerokuLineItemBilling

Object-ize Heroku Billing API Information and Upload to S3

## Deprecated
This project is not being developed. Feel free to fork!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'heroku_line_item_billing'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install heroku_line_item_billing

## Usage

    HEROKU_API_TOKEN=<API_TOKEN> \
    AWS_REGION=<REGION> \
    AWS_ACCESS_KEY_ID=<ID> \
    AWS_SECRET_ACCESS_KEY=<KEY> \
    AWS_BUCKET=<BUCKET_NAME> \
    AWS_OBJECT_KEY=<FOLDER_NAME> \
    TIME_PERIOD_MINUTES=<MINUTES> \
    ./bin/heroku_line_item_billing_upload_to_s3

## Contributing

1. Fork it ( https://github.com/[my-github-username]/heroku_line_item_billing/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
