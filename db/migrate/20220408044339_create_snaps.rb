class CreateSnaps < ActiveRecord::Migration[6.1]
  def change
    create_table :snaps do |t|
      t.string :title
      t.string :description
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
