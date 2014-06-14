class UserStatus < ActiveRecord::Migration
  def change
    create_table :user_statuses do |t|
      t.belongs_to :user
      t.string     :status
      t.timestamps
    end
  end
end
