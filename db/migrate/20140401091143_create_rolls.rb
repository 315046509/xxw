class CreateRolls < ActiveRecord::Migration
  def change
    create_table :rolls do |t|
      t.text :url
      t.attachment :avatar

      t.timestamps
    end
  end
end
