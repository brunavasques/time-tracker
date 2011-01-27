class CreateTimesheets < ActiveRecord::Migration
  def self.up
    create_table :timesheets do |t|
      t.string :owner

      t.timestamps
    end
  end

  def self.down
    drop_table :timesheets
  end
end
