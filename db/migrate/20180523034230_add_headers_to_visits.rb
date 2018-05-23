class AddHeadersToVisits < ActiveRecord::Migration[5.2]
  def change
    add_column :visits, :headers, :json, default: {}
  end
end
