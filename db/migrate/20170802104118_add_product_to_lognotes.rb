class AddProductToLognotes < ActiveRecord::Migration[5.0]
  def change
    add_column :lognotes, :product, :string, :default => "AWMS2"
  end
end
