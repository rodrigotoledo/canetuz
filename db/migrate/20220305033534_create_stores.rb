class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.string :login_at
      t.string :logout_at

      t.timestamps
    end
  end
end
