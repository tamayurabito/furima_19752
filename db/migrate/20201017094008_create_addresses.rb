class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.string  :postal_code,     null: false
      t.integer :prefectures_id,  null: false
      t.string  :citys,           null: false
      t.string  :addresses,       null: false
      t.string  :building_name
      t.string  :phone_number,    null: false
      t.integer :purchace_id,     null: false,  foreign_key: true


      t.timestamps
    end
  end
end
