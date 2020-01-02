class Bookmark < ApplicationRecord
  has_rich_text :content
  before_save :fetch_title

  def fetch_title
    uri = URI.parse(url)
    response = Net::HTTP.get(uri).force_encoding(Encoding::UTF_8)
    captures = /<title>(?<title>.+)<\/title>/m.match(response).named_captures
    self.title = captures['title']
  rescue => e
    logger.warn "Fetch Title Faild. url = [#{url}], error = #{e.message}"
  end

end
