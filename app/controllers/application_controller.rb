class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_filter :cors

  include SessionsHelper

  #TODO: should have a specific domain listed here rather than allowing *
  def cors
    debugger
    Rails.log.debug "++++++++ in CORS method+++++++++"
    headers["Access-Control-Allow-Origin"]  = '*'
    headers["Access-Control-Allow-Methods"] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
