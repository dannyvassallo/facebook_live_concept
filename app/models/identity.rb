class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider)
    graph = Koala::Facebook::API.new(auth.credentials.token)
    handle = auth.extra.raw_info[:username]
    profile_url = auth.extra.raw_info.link
    image = auth.info.image
    email = auth.info.email
    location = nil #auth.extra.raw_info.location.name
    gender = auth.extra.raw_info.gender
    age_range = graph.get_object('me?fields=age_range')['age_range'].min[1]
    find_or_create_by(
      uid: auth.uid,
      provider: auth.provider
    ).tap do |identity|
      case auth.provider
      when 'facebook'
        identity.update_attributes(
          :oauth_token => auth.credentials.token,
          :oauth_expires_at => Time.at(auth.credentials.expires_at.to_i)
        )
      end
    end
  end
end
