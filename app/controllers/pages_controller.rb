class PagesController < ApplicationController
  def terms
  end

  def welcome

    if current_user
      linkedin = current_user.authorizations.where(:provider => 'linkedin').first

      pin = session["linkedin_pin"]

      client = LinkedIn::Client.new('77q4hqiil0x8vq', 'vOnNLjt4wtJT6Zgy')

      #TODO: isn't working. authorizaiton fails for some reason

      client.authorize_from_request(linkedin.token, linkedin.secret, pin)

    end
  end

  def landing
  end
end
