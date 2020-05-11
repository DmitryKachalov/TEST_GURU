module ApplicationHelper
  BOOTSTRAP_CLASS = Hash.new('alert alert-danger').update(
      alert: 'alert alert-danger',
      notice: 'alert alert-success')

  def flash_message
    flash.map do |key, value|
      content_tag :p, value, class: "#{BOOTSTRAP_CLASS[key.to_sym]}"
    end.join.html_safe
  end
end
