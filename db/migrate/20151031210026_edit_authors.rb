class EditAuthors < ActiveRecord::Migration
  def change
    change_column_null :authors, :username, false
  end
end
