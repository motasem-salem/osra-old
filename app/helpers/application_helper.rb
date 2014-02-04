module ApplicationHelper

  def governorate_options
    Settings.governorates.collect { |g| [t("governorates.#{g[0]}", :default => g[0]), g[1]] }
  end

  def t_governorate(code)
    g = Settings.governorates.to_hash.key(code)
    if g
      t "governorates.#{g}"
    else
      "Undefined governorate code  -- #{code}"
    end
  end

  def t_status(status)
    t("statuses.#{status}", :default => status)
  end

  def status_options
    Settings.statuses.collect { |s| [t("statuses.#{s}", :default => s), s] }
  end

end