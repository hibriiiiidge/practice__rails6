class ArticlesController < ApplicationController
  def index
    qiita = QiitaTraveler::Client.new(username: 'hibriiiiidge')
    @articles = qiita.request_qiita_stocks
  end
end

