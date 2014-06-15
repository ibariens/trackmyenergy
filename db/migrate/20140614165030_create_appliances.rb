class CreateAppliances < ActiveRecord::Migration
  def change
    create_table :appliances do |t|
      t.string :name
      t.float  :consumption
      t.timestamps
    end
  end
end
