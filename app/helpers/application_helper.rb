module ApplicationHelper
  def format_url(url)
    url.prepend('https://') unless url.start_with?('http')
    url
  end

  def format_date(date)
    date.strftime
  end
end
