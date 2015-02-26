class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :url
      t.string :title
      t.datetime :datetime
      t.text :content
      t.string :photo

      t.timestamps
    end
  end
end
