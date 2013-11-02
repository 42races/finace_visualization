module ApplicationHelper
  def render_dates(dates)
    dates.map { |d| d.strftime('%d/%m') }.join(":")
  end

  def render_months(data)
    data.collect do |d|
      month, year = d.split("/")
      "#{Date::MONTHNAMES[month.to_i].slice(0,3)} #{year}"
    end.join(":")
  end

  def render_values(values)
    values.join(':')
  end

  def render_series(series)
    require 'json'
    JSON.generate(series)
  end
end
