puts "Seeding..."
  Branch.create( name: 'General Administration' )
  Branch.create( name: 'Sampaguita' )
  Branch.create( name: 'Muntingpulo' )
  
  InventoryItem.create( name: 'Burger box', item_type: 'Packaging', unit: 'piece', item_quantity: 500, market_price: 500 )
  InventoryItem.create( name: 'Burger buns', item_type: 'Ingredient', unit: 'piece', item_quantity: 6, market_price: 20 )
  InventoryItem.create( name: 'Small plastic', item_type: 'Packaging', unit: 'piece', item_quantity: 100, market_price: 85 )
  InventoryItem.create( name: 'Cucumber', item_type: 'Ingredient', unit: 'kilogram', item_quantity: 1.1, market_price: 170 )
  InventoryItem.create( name: 'Kamatis', item_type: 'Ingredient', unit: 'kilogram', item_quantity: 0.5, market_price: 150 )
  InventoryItem.create( name: 'Mantika', item_type: 'Ingredient', unit: 'liter', item_quantity: 1.5, market_price: 100 )
  InventoryItem.create( name: 'Repolyo', item_type: 'Ingredient', unit: 'kilogram', item_quantity: 1.1, market_price: 90 )
  InventoryItem.create( name: 'Catsup', item_type: 'Condement', unit: 'fluid ounce', item_quantity: 550, market_price: 44.5 )
  InventoryItem.create( name: 'Mayonnaise', item_type: 'Condement', unit: 'fluid ounce', item_quantity: 220, market_price: 61.45 )
  InventoryItem.create( name: 'ground beef', item_type: 'Ingredient', unit: 'kilogram', item_quantity: 1, market_price: 400 )
  InventoryItem.create( name: 'Paminta', item_type: 'Ingredient', unit: 'cup', item_quantity: 25, market_price: 20 )
  InventoryItem.create( name: 'Kinchay', item_type: 'Ingredient', unit: 'piece', item_quantity: 1, market_price: 25 )
  InventoryItem.create( name: 'Asin', item_type: 'Ingredient', unit: 'kilogram', item_quantity: 0.5, market_price: 40 )
  InventoryItem.create( name: 'Vetsin', item_type: 'Ingredient', unit: 'gram', item_quantity: 100, market_price: 31 )
  InventoryItem.create( name: 'bawang', item_type: 'Ingredient', unit: 'kilogram', item_quantity: 1, market_price: 120 )
  InventoryItem.create( name: 'sibuyas', item_type: 'Ingredient', unit: 'kilogram', item_quantity: 1, market_price: 80 )
puts "Seeding done"
  