if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_7dRLmPllVuXT3ZjEk98W7vx6',
    secret_key: 'sk_test_kseukJ9O5aBLfQNmcZ4iGWBG'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
