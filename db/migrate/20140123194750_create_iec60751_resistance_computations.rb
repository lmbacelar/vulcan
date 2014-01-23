class CreateIec60751ResistanceComputations < ActiveRecord::Migration
  def change
    create_table :iec60751_resistance_computations do |t|
      t.float  :resistance,   null: false
      t.float  :temperature,  null: false
      t.float  :r0,           null: false, default: 100.0
      t.float  :a,            null: false, default:   3.9083e-03
      t.float  :b,            null: false, default:  -5.7750e-07
      t.float  :c,            null: false, default:  -4.1830e-12

      t.timestamps
    end
  end
end
