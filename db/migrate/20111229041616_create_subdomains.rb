class CreateSubdomains < ActiveRecord::Migration
  def self.up
    create_table :subdomains do |t|
      t.string :username
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :subdomains
  end
end
