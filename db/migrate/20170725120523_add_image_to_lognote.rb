class AddImageToLognote < ActiveRecord::Migration[5.0]
  def change
    add_column :lognotes, :image, :string
  end
end
