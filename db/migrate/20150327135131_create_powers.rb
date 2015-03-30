class CreatePowers < ActiveRecord::Migration
  def change
    create_table :powers do |t|
      t.integer :powernum

      t.timestamps
    end
  end
end
