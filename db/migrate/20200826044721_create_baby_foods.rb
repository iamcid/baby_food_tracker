class CreateBabyFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :baby_foods do |t|
      t.string :flavor
      t.string :description
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
