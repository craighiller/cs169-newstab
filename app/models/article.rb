class Article < ActiveRecord::Base
  require 'pismo'
  
  def self.new_from_url url
      doc = Pismo[url]
      begin
        img = doc.images[0]
      rescue
        img = ""
      end
      p = {:title => doc.title, :content => doc.html_body, :datetime => doc.datetime, :photo => img, :url => url}
      self.new p
  end
  
end
