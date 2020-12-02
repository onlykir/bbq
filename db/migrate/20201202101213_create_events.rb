class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :address
      t.datetime :datetime

      t.timestamps
    end
  end
end
