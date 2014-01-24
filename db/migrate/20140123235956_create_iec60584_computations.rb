class CreateIec60584Computations < ActiveRecord::Migration
  def change
    create_table :iec60584_computations do |t|
      t.float  :emf       ,   null: false
      t.float  :temperature,  null: false
      t.string :type,         null: false
      t.float  :a3,           null: false, default: 0.0
      t.float  :a2,           null: false, default: 0.0
      t.float  :a1,           null: false, default: 0.0
      t.float  :a0,           null: false, default: 0.0

      t.timestamps
    end
  end
end
