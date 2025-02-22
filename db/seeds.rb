# db/seeds.rb

data = [
  { shipment: 8257, date_received: '2023-05-02', state_code: 'NY', rider_number: 67998,
    date_from: '2023-04-05', date_to: '2023-04-05', filings_received_volume: 1129, index_units_transmitted: 1129,
    index_date_transmitted: '2023-05-08', blank_party_units_transmitted: 427, blank_party_date_transmitted: '2023-05-10',
    collateral_units_transmitted: 0, collateral_date_transmitted: '2023-05-11', special_collateral_units_transmitted: 0,
    special_collateral_date_transmitted: 'N/A', tax_liens_units_transmitted: 5, tax_liens_date_transmitted: '2023-05-18',
    mdb_units_transmitted: 6, mdb_date_transmitted: '2023-05-18', office_products_units_transmitted: 7, office_products_date_transmitted: '2023-05-18' },

  { shipment: 8257, date_received: '2023-05-02', state_code: 'NY', rider_number: 67999,
    date_from: '2023-04-06', date_to: '2023-04-06', filings_received_volume: 1213, index_units_transmitted: 1213,
    index_date_transmitted: '2023-05-08', blank_party_units_transmitted: 516, blank_party_date_transmitted: '2023-05-10',
    collateral_units_transmitted: 0, collateral_date_transmitted: '2023-05-12', special_collateral_units_transmitted: 0,
    special_collateral_date_transmitted: 'N/A', tax_liens_units_transmitted: 3, tax_liens_date_transmitted: '2023-05-18',
    mdb_units_transmitted: 6, mdb_date_transmitted: '2023-05-18', office_products_units_transmitted: 6, office_products_date_transmitted: '2023-05-18' },

  { shipment: 8257, date_received: '2023-05-02', state_code: 'NY', rider_number: 68000,
    date_from: '2023-04-07', date_to: '2023-04-07', filings_received_volume: 902, index_units_transmitted: 902,
    index_date_transmitted: '2023-05-08', blank_party_units_transmitted: 276, blank_party_date_transmitted: '2023-05-11',
    collateral_units_transmitted: 0, collateral_date_transmitted: '2023-05-12', special_collateral_units_transmitted: 0,
    special_collateral_date_transmitted: 'N/A', tax_liens_units_transmitted: 6, tax_liens_date_transmitted: '2023-05-18',
    mdb_units_transmitted: 6, mdb_date_transmitted: '2023-05-18', office_products_units_transmitted: 6, office_products_date_transmitted: '2023-05-18' },

  { shipment: 8257, date_received: '2023-05-02', state_code: 'NY', rider_number: 68001,
    date_from: '2023-04-08', date_to: '2023-04-08', filings_received_volume: 90, index_units_transmitted: 90,
    index_date_transmitted: '2023-05-08', blank_party_units_transmitted: 27, blank_party_date_transmitted: '2023-05-11',
    collateral_units_transmitted: 0, collateral_date_transmitted: '2023-05-12', special_collateral_units_transmitted: 0,
    special_collateral_date_transmitted: 'N/A', tax_liens_units_transmitted: 0, tax_liens_date_transmitted: 'N/A',
    mdb_units_transmitted: 6, mdb_date_transmitted: '2023-05-18', office_products_units_transmitted: 6, office_products_date_transmitted: '2023-05-18' },

  { shipment: 8257, date_received: '2023-05-02', state_code: 'NY', rider_number: 68002,
    date_from: '2023-04-09', date_to: '2023-04-09', filings_received_volume: 28, index_units_transmitted: 28,
    index_date_transmitted: '2023-05-08', blank_party_units_transmitted: 5, blank_party_date_transmitted: '2023-05-11',
    collateral_units_transmitted: 0, collateral_date_transmitted: '2023-05-12', special_collateral_units_transmitted: 0,
    special_collateral_date_transmitted: 'N/A', tax_liens_units_transmitted: 0, tax_liens_date_transmitted: 'N/A',
    mdb_units_transmitted: 6, mdb_date_transmitted: '2023-05-18', office_products_units_transmitted: 6, office_products_date_transmitted: '2023-05-18' }
]

# Loop through the data array and create records for the ucc_inventories table
data.each do |inventory|
  UccInventory.create(inventory)
end

puts "UCC Inventory data seeded successfully!"
