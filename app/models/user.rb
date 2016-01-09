class User < ActiveRecord::Base
  def fb_posts(page)
    fb = Koala::Facebook::API.new(oauth_token)
    if page
      fb.get_page(page)
    else
      fb.get_connections('me', 'feed?fields=id,story,message,likes.summary(true)')
    end
  end

  def self.from_omniauth(auth)
    user_name = auth.extra.raw_info.name
    user_attrs = auth.slice(:provider, :uid).to_hash
    where(user_attrs).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = user_name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
