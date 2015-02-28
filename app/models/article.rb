class Article < ActiveRecord::Base
  require 'pismo'
  
  validates_presence_of :url
  validates_presence_of :initial_comment
  
  def self.new_from_url(article_params)
      url = article_params[:url]
      initial_comment = article_params[:initial_comment]
      doc = Pismo[url]
      begin
        img = doc.images[0]
      rescue
        img = ""
      end
      p = {:title => doc.title, :content => doc.html_body, :datetime => doc.datetime, :photo => img, :url => url, :initial_comment => initial_comment}
      self.new p
  end
  
end
