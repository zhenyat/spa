class ApplicationController < ActionController::Base
  include Zt
  before_action :set_locale
end
