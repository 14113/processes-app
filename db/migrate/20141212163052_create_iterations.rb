class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.references :trip
      t.datetime :finished_at

      t.timestamps
    end
  end
end
