module ApplicationHelper
  BOOTSTRAP_CLASS = Hash.new('alert alert-danger').update(
      alert: 'alert alert-danger',
      notice: 'alert alert-success')

  def flash_message
    flash.map do |key, value|
      content_tag :p, value.html_safe, class: "#{BOOTSTRAP_CLASS[key.to_sym]}"
    end.join.html_safe
  end

  def format_seconds(seconds_to_format = 0)
    return '-' if seconds_to_format <= 0

    Time.at(seconds_to_format).utc.strftime('%H:%M:%S')
  end
end
