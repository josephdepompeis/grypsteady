class User < ActiveRecord::Base
  has_secure_password
  has_many :boards
  validates :name, presence: true

  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  end

  def self.create_user_from_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['first_name'].to_s
      user.password = SecureRandom.hex
      user.save
    end
  end

end
