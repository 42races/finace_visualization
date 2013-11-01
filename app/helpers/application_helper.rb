module ApplicationHelper
  def render_dates(dates)
    dates.map { |d| d.sub(/\/\d\d\d\d$/,"") }.join(":")
  end

  def render_values(values)
    values.join(':')
  end
end
