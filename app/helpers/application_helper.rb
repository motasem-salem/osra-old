module ApplicationHelper

  def option_values(option)
    Settings["#{option}"].collect { |s| [t("#{option}.#{s}", :default => s), s] }
  end

  def t_option(option, code)
    t("#{option}.#{code}", :default => code)
  end
end