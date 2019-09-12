class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :rut
      t.string :name
      t.string :last_name
      t.boolean :prescense
      t.integer :n_list

      t.timestamps
    end
  end
end
