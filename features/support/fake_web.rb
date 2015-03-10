# #features/support/fake_web.rb
# require 'fake_web'

# #I'm important for the secure get for verify_credentials
# require 'net/https'

# #During OAuthcalypse this base URL changed.
# FACEBOOK_API_BASE = 'https://api.facebook.com/'

# FakeWeb.allow_net_connect = false
# FakeWeb.register_uri(:post, FACEBOOK_API_BASE + 'oauth/request_token',
#   :body => 'oauth_token=fake'
# )
# FakeWeb.register_uri(:post, FACEBOOK_API_BASE + 'oauth/access_token',
#   :body => 'oauth_token=fake&oauth_token_secret=fake'
# )
# FakeWeb.register_uri(:get,
#   FACEBOOK_API_BASE + '1/account/verify_credentials.json',
#   :body => File.join(Rails.root.to_s,
#     'features', 'fixtures', 'verify_credentials.json'
#   )
# )