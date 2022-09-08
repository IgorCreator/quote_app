class ApplicationController < ActionController::Base
  helper_method :flash_style

  def flash_style(level)
    case level
    when "notice" then "info"
    when "success" then "success"
    when "error" then "danger"
    when "alert" then "warning"
    end
  end
end
