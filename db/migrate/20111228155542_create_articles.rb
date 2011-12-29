class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.text :body
      t.string :category
      t.string :region
      t.string :status
      t.integer :page_id
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
