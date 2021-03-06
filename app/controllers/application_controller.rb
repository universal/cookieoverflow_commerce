class ApplicationController < ActionController::Base
  protect_from_forgery
  private
  
  def is_mobile?
    if session[:go_mobile]
      session[:go_mobile] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
  
  helper_method :is_mobile?
  
  def prepare_format
    session[:go_mobile] = params[:mobile] if params[:mobile]
    request.format = :mobile if is_mobile?
  end
end
