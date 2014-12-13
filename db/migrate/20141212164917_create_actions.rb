class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.references :iteration, index: true
      t.references :todo, index: true
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
