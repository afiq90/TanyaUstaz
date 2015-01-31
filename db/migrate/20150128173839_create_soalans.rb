class CreateSoalans < ActiveRecord::Migration
  def change
    create_table :soalans do |t|
      t.string :name
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
