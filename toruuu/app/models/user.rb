class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:omniauthable,:registerable,
         :recoverable, :rememberable, :trackable, :validatable



  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:     auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    User.dummy_email(auth),
                         password: Devise.friendly_token[0,20]
                        )
    end
    user
  end


   def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end


  # 通常サインアップ時のuid用、Twitter OAuth認証時のemail用にuuidな文字列を生成
  def self.create_unique_string
    SecureRandom.uuid
  end
end
