Rails.configuration.stripe = {
	:publishable_key => Rails.application.secrets.pk_test_0E4AqwAp9KG5LjowBASZUTdW,
	:secret_key      => Rails.application.secrets.sk_test_yvUox3SPnjrmREgCD8ERilcz
}

Stripe.api_key = Rails.application.secrets.secret_key