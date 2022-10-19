class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :detail
      t.date :due_date
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
