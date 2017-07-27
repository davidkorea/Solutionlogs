class AddDetailsToLognote < ActiveRecord::Migration[5.0]
  def change
    add_column :lognotes, :organization, :text
    add_column :lognotes, :customertype, :string
    add_column :lognotes, :opco, :string
    add_column :lognotes, :calldate, :date
    add_column :lognotes, :handled_by, :string
    add_column :lognotes, :resolved, :boolean
    add_column :lognotes, :source, :string
    add_column :lognotes, :attachment, :text
  end
end
