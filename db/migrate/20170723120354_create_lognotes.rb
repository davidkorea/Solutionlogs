class CreateLognotes < ActiveRecord::Migration[5.0]
  def change
    create_table :lognotes do |t|
      t.string :caseid
      t.text :title
      t.text :description

      t.timestamps
    end
  end
end
