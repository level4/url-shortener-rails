class RenameUrlIdToRedirectId < ActiveRecord::Migration[5.2]
  def change
    rename_column :visits, :url_id, :redirect_id
  end
end
