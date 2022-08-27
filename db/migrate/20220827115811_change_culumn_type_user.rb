class ChangeCulumnTypeUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :birthdate, :date
  end
end
