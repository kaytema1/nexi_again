class CreateAdvertisements < ActiveRecord::Migration
  def self.up
    create_table :advertisements do |t|

      t.string :permalink
      t.integer :page_id
      t.timestamps
    end
  end

  def self.down
    drop_table :advertisements
  end
end
