module ApplicationHelper

  def option_values(option)
    if option == 'governorates'
      Settings.governorates.collect { |g| [t("governorates.#{g[0]}", :default => g[0]), g[1]] }
    else
      Settings["#{option}"].collect { |s| [t("#{option}.#{s}", :default => s), s] }
    end
  end

  def t_option(option, code)
    if option == 'governorates'
      g = Settings.governorates.to_hash.key(code)
      if g
        t "governorates.#{g}"
      else
        "Undefined governorate code  -- #{code}"
      end
    else
      t("#{option}.#{code}", :default => code)
    end
  end
end