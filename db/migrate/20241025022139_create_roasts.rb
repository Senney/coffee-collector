class CreateRoasts < ActiveRecord::Migration[8.0]
  def change
    create_table :roasts do |t|
      t.string :name
      t.string :origin
      t.text :notes
      t.date :roasted_on
      t.date :acquired_on
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
