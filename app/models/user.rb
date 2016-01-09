class User < ActiveRecord::Base
  def fb_posts
    fb = Koala::Facebook::API.new(oauth_token)
    fb.get_connections('me', 'feed')
  end

  def self.from_omniauth(auth)
    user_attrs = auth.slice(:provider, :uid).to_hash
    where(user_attrs).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
