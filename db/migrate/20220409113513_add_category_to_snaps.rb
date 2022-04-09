class AddCategoryToSnaps < ActiveRecord::Migration[6.1]
  def change
    add_reference :snaps, :category, null: false, foreign_key: true
  end
end
