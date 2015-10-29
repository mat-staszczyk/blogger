class EditViewCountToArticles < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.remove :view_count
    end
  end
end
