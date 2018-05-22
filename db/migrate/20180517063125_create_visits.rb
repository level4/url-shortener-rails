class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|

      t.references :redirect
      t.string     :referrer
      t.string     :user_agent
      t.inet       :ip


      t.timestamps
    end
  end
end
