class FixPhotoColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :photos, :photo, :string, :null => false
  end
end
