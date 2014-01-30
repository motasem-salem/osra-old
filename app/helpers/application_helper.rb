module ApplicationHelper
  
  def governante_options
    Settings.governantes.collect { |g| [t("governantes.#{g[0]}",:default => g[0]),g[1]] }
  end
  
  def t_governante(code)
    g = Settings.governantes.to_hash.key(code)
    if g
      t "governantes.#{g}"
    else
      "Undefined governante code  -- #{code}"
    end
  end
  
  def status_options
    Settings.statuses.collect { |s| [t("statuses.#{s}",:default => s),s] }
  end
  
end