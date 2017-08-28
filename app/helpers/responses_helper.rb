module ResponsesHelper
  def format_time(hour, minute)
    I18n.l Time.zone.parse("#{hour}:#{minute}"), format: '%H:%M'
  end

  def format_date(date)
    I18n.l date, format: '%a, %d %b %Y'
  end

  def format_datetime(datetime)
    I18n.l datetime, format: '%a, %d %b %Y %H:%M'
  end

  def format_stantup_time(response)
    format_time response.team.standup_end_hour, response.team.standup_end_minute
  end

  def format_stantup_end(day)
    format_datetime day.standup_end
  end

  def time_to_js(datetime)
    datetime.to_f * 1000
  end
end
