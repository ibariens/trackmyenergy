class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string  :pattern_id
      t.integer :appliance_id
      t.timestamps
    end
  end
end
