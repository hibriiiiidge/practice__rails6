class Bookmark < ApplicationRecord
  before_save :fetch_title

  def fetch_title
    puts 'hello fetch_title'
    self.title = 'sample'
  end
end
