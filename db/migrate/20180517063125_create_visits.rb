class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.string :url, null: false
      t.string :shortened, null: false

      t.timestamps
    end
  end
end
