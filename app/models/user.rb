class User < ActiveRecord::Base

  extend OmniauthCallbacks
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :omniauthable

  before_save :ensure_authentication_token
  after_save  :send_welcome_email
  has_many :boards

  private

  def send_welcome_email
    Notifier.delay.welcome_email(self)
  end

end
