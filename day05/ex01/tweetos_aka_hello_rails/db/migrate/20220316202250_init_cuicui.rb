class InitCuicui < ActiveRecord::Migration
  def change
    create_table :cuicuis, id: false do |t|
      t.integer :id
      t.text :content
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
