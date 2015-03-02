class AddArticleRefToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :article, index: true
  end
end
