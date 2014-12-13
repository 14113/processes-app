class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name
      t.text :description
      t.references :trip, index: true

      t.timestamps
    end
  end
end
