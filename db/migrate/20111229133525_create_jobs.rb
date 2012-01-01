class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.date :application_due
      t.text :job_description
      t.string :permalink
      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
