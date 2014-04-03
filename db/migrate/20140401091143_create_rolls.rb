class CreateRolls < ActiveRecord::Migration
  def change
    create_table :rolls do |t|
      t.text :url
      t.attachment :avatar
      t.integer :question_category_id, :default => 0

      t.timestamps
    end
  end
end
