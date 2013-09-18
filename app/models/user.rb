class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :omniauthable, :omniauth_providers => [:twitter]

  extend OmniauthCallbacks
  before_save :ensure_authentication_token
  after_save  :send_welcome_email
  has_many :boards

  def find_or_create_for_twitter(response)
    data = response['extra']['raw_info']
    if user = User.find_by_twitter_id(data["id"].to_s)
      user
    else # Create a user with a stub password.
      user = User.new(:email => "twitter+#{data["id"]}@example.com",
                      :password => Devise.friendly_token[0,20])
                      user.twitter_id = data["id"]
                      user.twitter_screen_name = data["screen_name"]
                      user.twitter_display_name = data["display_name"]
                      user.confirm!
                      user
    end
  end
  private

  def send_welcome_email
    Notifier.delay.welcome_email(self)
  end

end
