require 'open-uri'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class ApplicationController < ActionController::Base
  before_action :current_user
  helper_method :current_user
  helper_method :random_name
  helper_method :logged_in?
  after_filter :short_session

  def current_user
    current_user = User.find_by(id: session[:user_id])
  end

  def random_name
    if cookies[:username] == nil 
      url = "https://generatefakename.com/ru/name/random/en/us"
      doc = Nokogiri::HTML(open(url))
      name = doc.css('h3').first.text
      cookies[:username] = {:value => name, :expires => Time.now + 60 }
    end
    return cookies[:username]
  end

  def logged_in?  
    !current_user.nil?
  end

  def short_session
    request.session_options = request.session_options.dup
    request.session_options[:expire_after] = 1.minute
    request.session_options.freeze
  end
  
end
