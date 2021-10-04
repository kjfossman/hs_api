class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :color
      t.string :theme
      t.text :quote

      t.timestamps
    end
  end
end
