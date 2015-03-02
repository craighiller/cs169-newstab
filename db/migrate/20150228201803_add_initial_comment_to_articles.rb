class AddInitialCommentToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :initial_comment, :text
  end
end
