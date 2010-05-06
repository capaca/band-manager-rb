# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  # Set translation for will paginate 'Previous' and 'Next' buttons
  #
  before_filter :set_locale 
  
  protected

  def set_locale 
    # if params[:locale] is nil then I18n.default_locale will be used  
    I18n.locale = params[:locale] 
    set_will_paginate_locale
  end 

  def get_message(key, type = :success)
    t "messages.#{type.to_s}.#{key}"
  end
  
  private 
  
  def set_will_paginate_locale
    WillPaginate::ViewHelpers.
      pagination_options[:prev_label]='&laquo; ' + I18n.t("band_manager.pagination.prev")
    WillPaginate::ViewHelpers.
      pagination_options[:next_label]=I18n.t("band_manager.pagination.next") + ' &raquo;'
  end
end
