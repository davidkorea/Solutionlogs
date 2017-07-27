class AddUserIdToLognote < ActiveRecord::Migration[5.0]
  def change
    add_column :lognotes, :user_id, :integer
  end
end
