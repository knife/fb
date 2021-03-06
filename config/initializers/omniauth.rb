Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'],
    scope: 'user_about_me,user_posts',
    client_options: {
      site: 'https://graph.facebook.com/v2.0',
      authorize_url: 'https://www.facebook.com/v2.0/dialog/oauth'
    }
end
