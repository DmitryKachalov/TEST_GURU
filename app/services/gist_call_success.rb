class GistCallSuccess
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def success?
    true
  end

  def html_link
    "<a href='#{url}' target='_blank'>#{url}</a>"
  end
end
