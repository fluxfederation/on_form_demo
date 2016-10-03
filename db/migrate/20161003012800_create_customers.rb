class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string   :name,            null: false
      t.string   :email
      t.string   :phone_number
      t.date     :date_of_birth
      t.timestamps
    end
  end
end
