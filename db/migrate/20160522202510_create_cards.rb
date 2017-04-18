class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text     "original_text"
      t.text     "translated_text"
      t.date     "review_date"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "user_id"
    end
  end
end
