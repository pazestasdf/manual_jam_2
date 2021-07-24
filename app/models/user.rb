class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
        :omniauthable, omniauth_providers: %i[facebook]

  validates:name, presence: true

  has_many :stories
  def admin?
    self.admin
  end
  # 
  def self.from_omniauth(auth)
    name_split = auth.info.name.split(" ")
    user = User.where(email: auth.info.email).first
    user ||= User.create!(provider: auth.provider, uid: auth.uid, name: name_split[1], email: auth.info.email, password: Devise.friendly_token[0, 20])
      user
  end

end