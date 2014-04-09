class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :descrpiton
      t.integer :question_category_id, :default => 0

      t.timestamps
    end
  end
end
