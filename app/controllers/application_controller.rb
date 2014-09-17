class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
        flash[:error] = exception.message
        redirect_to root_url
    end
    
  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || welcome_path
    end
  end

end
