module Users
  class Users::OmniauthCallbacksController < ApplicationController
    def twitter
      @user = User.find_or_create_for_twitter(env["omniauth.auth"])
    end

    def failure
      render "failure"
    end
    
  end
end
