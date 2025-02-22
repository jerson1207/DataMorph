class CreateUccInventories < ActiveRecord::Migration[8.0]
  def change
    create_table :ucc_inventories do |t|
      t.integer :shipment
      t.date :date_received
      t.string :inventory_type
      t.string :state_code
      t.integer :rider_number
      t.date :date_from
      t.date :date_to
      t.integer :filings_received_volume
      t.integer :index_units_transmitted
      t.string :index_date_transmitted
      t.integer :blank_party_units_transmitted
      t.string :blank_party_date_transmitted
      t.integer :collateral_units_transmitted
      t.string :collateral_date_transmitted
      t.integer :special_collateral_units_transmitted
      t.string :special_collateral_date_transmitted
      t.integer :tax_liens_units_transmitted
      t.string :tax_liens_date_transmitted
      t.integer :frames_scanned_units_transmitted
      t.string :frames_scanned_date_transmitted
      t.integer :mdb_units_transmitted
      t.string :mdb_date_transmitted
      t.integer :office_products_units_transmitted
      t.string :office_products_date_transmitted
      t.integer :tat_index
      t.integer :tat_blank_party
      t.integer :tat_collateral
      t.integer :tat_special_collateral
      t.integer :tat_tax_liens
      t.integer :tat_mdb
      t.integer :tat_office_products

      t.timestamps
    end

    # Individual indexes (useful for OR conditions)
    add_index :ucc_inventories, :date_received
    add_index :ucc_inventories, :index_date_transmitted
    add_index :ucc_inventories, :blank_party_date_transmitted
    add_index :ucc_inventories, :collateral_date_transmitted
    add_index :ucc_inventories, :special_collateral_date_transmitted
    add_index :ucc_inventories, :tax_liens_date_transmitted
    add_index :ucc_inventories, :frames_scanned_date_transmitted
    add_index :ucc_inventories, :mdb_date_transmitted
    add_index :ucc_inventories, :office_products_date_transmitted

    # Composite indexes (useful for AND conditions)
    add_index :ucc_inventories, [ :date_received, :inventory_type ]
    add_index :ucc_inventories, [ :date_received, :state_code ]
  end
end
