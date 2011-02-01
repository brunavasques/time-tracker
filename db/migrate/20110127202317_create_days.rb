class CreateDays < ActiveRecord::Migration
  def self.up
    create_table :days do |t|
      t.datetime :arrival
      t.datetime :departure
      t.datetime :lunchtime
      t.datetime :back_from_lunch
      t.datetime :other
      t.references :timesheet

      t.timestamps
    end
  end

  def self.down
    drop_table :days
  end
end
