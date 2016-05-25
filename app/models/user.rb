class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,

         :omniauthable, :omniauth_providers => [:facebook]


         has_many :pins
         validates :name, presence: true

          def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
       # user.name = auth.info.first_name
        # user.name = oauth_data["info"]["first_name"]
        user.name = auth.info.name
        user.image = auth.info.cover
      end
  end

end
