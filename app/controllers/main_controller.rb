class MainController < ApplicationController

  def index

  end

  def set_locale
    locale = params[:id]
    raise 'unsupported locale' unless ['ar', 'en'].include?(locale)
    I18n.locale = locale || I18n.default_locale
    redirect_to :back
  end

end