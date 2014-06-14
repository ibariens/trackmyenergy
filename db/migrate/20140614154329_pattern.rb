class Pattern < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :name
      t.text   :pattern
      t.timestamps
    end
  end
end
