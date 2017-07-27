class AddBeResolvedToLognote < ActiveRecord::Migration[5.0]
  def change
      add_column :lognotes, :be_resolved, :boolean, default: false
  end
end
