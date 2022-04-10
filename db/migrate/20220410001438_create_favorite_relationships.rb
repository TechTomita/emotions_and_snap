class CreateFavoriteRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_relationships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :snap, null: false, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :snap_id], unique: true
    end
  end
end
