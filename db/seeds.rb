require 'faker'

# Clear existing records
UccInventory.destroy_all

# Seed 50 records
50.times do
  UccInventory.create!(
    shipment: Faker::Number.number(digits: 4),
    date_received: Faker::Date.backward(days: 30),
    inventory_type: [ "COL ONLY", "INDEX", "MDB ONLY", "COL/MDB" ].sample,
    state_code: Faker::Address.state_abbr,
    rider_number: Faker::Number.number(digits: 4),
    date_from: Faker::Date.backward(days: 60),
    date_to: Faker::Date.backward(days: 30),
    filings_received_volume: Faker::Number.between(from: 10, to: 1000),
    index_units_transmitted: Faker::Number.between(from: 10, to: 500),
    index_date_transmitted: Faker::Date.backward(days: 20).to_s,
    blank_party_units_transmitted: Faker::Number.between(from: 10, to: 500),
    blank_party_date_transmitted: Faker::Date.backward(days: 20).to_s,
    collateral_units_transmitted: Faker::Number.between(from: 10, to: 500),
    collateral_date_transmitted: Faker::Date.backward(days: 20).to_s,
    special_collateral_units_transmitted: Faker::Number.between(from: 10, to: 500),
    special_collateral_date_transmitted: Faker::Date.backward(days: 20).to_s,
    tax_liens_units_transmitted: Faker::Number.between(from: 10, to: 500),
    tax_liens_date_transmitted: Faker::Date.backward(days: 20).to_s,
    frames_scanned_units_transmitted: Faker::Number.between(from: 10, to: 500),
    frames_scanned_date_transmitted: Faker::Date.backward(days: 20).to_s,
    mdb_units_transmitted: Faker::Number.between(from: 10, to: 500),
    mdb_date_transmitted: Faker::Date.backward(days: 20).to_s,
    office_products_units_transmitted: Faker::Number.between(from: 10, to: 500),
    office_products_date_transmitted: Faker::Date.backward(days: 20).to_s,
    tat_index: Faker::Number.between(from: 1, to: 10),
    tat_blank_party: Faker::Number.between(from: 1, to: 10),
    tat_collateral: Faker::Number.between(from: 1, to: 10),
    tat_special_collateral: Faker::Number.between(from: 1, to: 10),
    tat_tax_liens: Faker::Number.between(from: 1, to: 10),
    tat_mdb: Faker::Number.between(from: 1, to: 10),
    tat_office_products: Faker::Number.between(from: 1, to: 10)
  )
end

50.times do
  UccInventory.create!(
    shipment: Faker::Number.number(digits: 4),
    date_received: Faker::Date.backward(days: 30),
    inventory_type: [ "COL ONLY", "INDEX", "MDB ONLY", "COL/MDB" ].sample,
    state_code: Faker::Address.state_abbr,
    rider_number: Faker::Number.number(digits: 4),
    date_from: Faker::Date.backward(days: 60),
    date_to: Faker::Date.backward(days: 30),
    filings_received_volume: Faker::Number.between(from: 10, to: 1000),
    index_units_transmitted: Faker::Number.between(from: 10, to: 500),
    index_date_transmitted: rand(10).even? ? "n/a" : "",
    blank_party_units_transmitted: Faker::Number.between(from: 10, to: 500),
    blank_party_date_transmitted: "",
    collateral_units_transmitted: Faker::Number.between(from: 10, to: 500),
    collateral_date_transmitted: "",
    special_collateral_units_transmitted: Faker::Number.between(from: 10, to: 500),
    special_collateral_date_transmitted: "",
    tax_liens_units_transmitted: Faker::Number.between(from: 10, to: 500),
    tax_liens_date_transmitted: "",
    frames_scanned_units_transmitted: Faker::Number.between(from: 10, to: 500),
    frames_scanned_date_transmitted: "",
    mdb_units_transmitted: Faker::Number.between(from: 10, to: 500),
    mdb_date_transmitted: "",
    office_products_units_transmitted: Faker::Number.between(from: 10, to: 500),
    office_products_date_transmitted: Faker::Date.backward(days: 20).to_s,
    tat_index: Faker::Number.between(from: 1, to: 10),
    tat_blank_party: Faker::Number.between(from: 1, to: 10),
    tat_collateral: Faker::Number.between(from: 1, to: 10),
    tat_special_collateral: Faker::Number.between(from: 1, to: 10),
    tat_tax_liens: Faker::Number.between(from: 1, to: 10),
    tat_mdb: Faker::Number.between(from: 1, to: 10),
    tat_office_products: Faker::Number.between(from: 1, to: 10)
  )
end




data = [
  { shipment: 8257, date_received: '2023-05-01', inventory_type: 'COL ONLY', state_code: 'NY', rider_number: 67998,
    date_from: '2023-04-05', date_to: '2023-04-05', filings_received_volume: 1129, index_units_transmitted: 1129,
    index_date_transmitted: '2023-05-01', blank_party_units_transmitted: 427, blank_party_date_transmitted: '2023-05-10',
    collateral_units_transmitted: 0, collateral_date_transmitted: '2023-05-11', special_collateral_units_transmitted: 0,
    special_collateral_date_transmitted: 'N/A', tax_liens_units_transmitted: 5, tax_liens_date_transmitted: '2023-05-18',
    mdb_units_transmitted: 6, mdb_date_transmitted: '2023-05-18', office_products_units_transmitted: 7, office_products_date_transmitted: '2023-05-18' },

  { shipment: 8257, date_received: '2023-05-02',  inventory_type: 'INDEX', state_code: 'NY', rider_number: 67999,
    date_from: '2023-04-06', date_to: '2023-04-06', filings_received_volume: 1213, index_units_transmitted: 1213,
    index_date_transmitted: '2023-05-08', blank_party_units_transmitted: 516, blank_party_date_transmitted: '2023-05-2',
    collateral_units_transmitted: 0, collateral_date_transmitted: '2023-05-12', special_collateral_units_transmitted: 0,
    special_collateral_date_transmitted: 'N/A', tax_liens_units_transmitted: 3, tax_liens_date_transmitted: '2023-05-18',
    mdb_units_transmitted: 6, mdb_date_transmitted: '2023-05-18', office_products_units_transmitted: 6, office_products_date_transmitted: '2023-05-18' },

  { shipment: 8257, date_received: '2023-05-03', inventory_type: 'COL ONLY', state_code: 'NY', rider_number: 68000,
    date_from: '2023-04-07', date_to: '2023-04-07', filings_received_volume: 902, index_units_transmitted: 902,
    index_date_transmitted: '2023-05-08', blank_party_units_transmitted: 276, blank_party_date_transmitted: '2023-05-11',
    collateral_units_transmitted: 0, collateral_date_transmitted: '2023-05-12', special_collateral_units_transmitted: 0,
    special_collateral_date_transmitted: 'N/A', tax_liens_units_transmitted: 6, tax_liens_date_transmitted: '2023-05-18',
    mdb_units_transmitted: 6, mdb_date_transmitted: '2023-05-18', office_products_units_transmitted: 6, office_products_date_transmitted: '2023-05-18' },

  { shipment: 8257, date_received: '2023-05-02', inventory_type: 'COL ONLY', state_code: 'NY', rider_number: 68001,
    date_from: '2023-04-08', date_to: '2023-04-08', filings_received_volume: 90, index_units_transmitted: 90,
    index_date_transmitted: '2023-05-08', blank_party_units_transmitted: 27, blank_party_date_transmitted: '2023-05-11',
    collateral_units_transmitted: 0, collateral_date_transmitted: '2023-05-12', special_collateral_units_transmitted: 0,
    special_collateral_date_transmitted: 'N/A', tax_liens_units_transmitted: 0, tax_liens_date_transmitted: 'N/A',
    mdb_units_transmitted: 6, mdb_date_transmitted: '2023-05-18', office_products_units_transmitted: 6, office_products_date_transmitted: '2023-05-18' },

  { shipment: 8257, date_received: '2023-05-02', inventory_type: 'COL ONLY', state_code: 'NY', rider_number: 68002,
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
