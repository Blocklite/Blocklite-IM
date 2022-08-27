class CreateLinxes < ActiveRecord::Migration[7.0]
  def change
    create_table :linxes do |t|
      t.string :linx
      t.string :linx_type

      t.timestamps
    end
    add_index :linxes, :linx
    add_index :linxes, :linx_type
  end
end
