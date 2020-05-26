
Product.delete_all
Category.delete_all
ProductCategory.delete_all

#Category
children = Category.create(name: "Children")
kitchen = Category.create(name: "Kitchen")
outdoor = Category.create(name: "Outdoor")
electronics = Category.create(name: "Electronics")
clothing = Category.create(name: "Clothing")
furniture = Category.create(name: "Furniture")

#Product
ball = Product.create(name:"ball", price:2.99 , tagline:"Bouncy fun for all ages!")
doll = Product.create(name:"doll", price:12.99 , tagline: "Play pretend!")
rocking_horse = Product.create(name:"rocking horse", price:79.99 , tagline: "Giddyup!")
legos = Product.create(name:"Legos", price:45.00 , tagline: "Build fun structures!")
ps4 = Product.create(name:"PlayStation 4", price:200.00 , tagline: "Hours of Gaming!")

blender = Product.create(name:"blender", price:29.99 , tagline: "Make delicous smoothies!")
tv = Product.create(name:"television", price:315.00 , tagline: "create HD Widescreen!")
charger = Product.create(name:"charger", price:19.99 , tagline: "Rapid charge!")
headphones = Product.create(name:"headphones", price:60.00 , tagline: "Bluetooth!")
microwave = Product.create(name:"microwave", price:89.99 , tagline: "Heat up meals!")

dish_towel = Product.create(name:"dish towel", price:2.99 , tagline: "Keep clean in the kitchen!")
skillet = Product.create(name:"skillet", price:14.99 , tagline: "pancake dreams!")
knife_set = Product.create(name:"knife set", price:65.00 , tagline: "Sharp!")
spice_rack = Product.create(name:"spice rack", price:40.00 , tagline: "Keep your spices organized!")
glasses = Product.create(name:"drinking glasses", price:20.00 , tagline: "Looks like real crystal!")

patio_chair = Product.create(name:"patio chair", price:50.00 , tagline: "Relax outdoors!")
plant = Product.create(name:"plant", price:10.00 , tagline: "Add greenery!")
hammock = Product.create(name:"hammock", price:50.00 , tagline: "Hang around!")
deck_table = Product.create(name:"deck table", price:250.00 , tagline: "Enjoy the deck!")
garden_hose = Product.create(name:"garden hose", price:29.85 , tagline: "Water your garden!")

armchair = Product.create(name:"armchair", price:64.00 , tagline: "Cozy!")
nightstand = Product.create(name:"night stand", price:29.85 , tagline: "Perfect for the small things!")
bunk_bed = Product.create(name:"bunk bed", price:395.00 , tagline: "Two kids, half the space!")
coffee_table = Product.create(name:"coffee table", price:79.85 , tagline: "Display your magazines!")
sofa = Product.create(name:"sofa", price:765.00 , tagline: "Stain resistant!")

dress = Product.create(name:"dress", price:55.00 , tagline: "Dress it up or dress it down!")
cowboy_boots = Product.create(name:"red cowboy boots", price:45.00 , tagline: "Yee haw!")
pants = Product.create(name:"office pants", price:115.00 , tagline: "Slim cut")
hat = Product.create(name:"blue beret", price:21.00 , tagline: "Affordable French fashion!")
socks = Product.create(name:"socks", price:5.00 , tagline: "Fuzzy socks, warm feet!")

#ProductCategory
ball_pc = ProductCategory.create(product: ball, category: children)
ball_pc2 = ProductCategory.create(product: ball, category: outdoor)
doll_pc = ProductCategory.create(product: doll, category: children)
rocking_horse_pc = ProductCategory.create(product: rocking_horse, category: children)
legos_pc = ProductCategory.create(product: legos, category: children)
ps4_pc = ProductCategory.create(product: ps4, category: children)
ps4_pc2 = ProductCategory.create(product: ps4, category: electronics)

blender_pc = ProductCategory.create(product: blender, category: kitchen)
blender_pc2 = ProductCategory.create(product: blender, category: electronics)
tv_pc = ProductCategory.create(product: tv, category: electronics)
charger_pc = ProductCategory.create(product: charger, category: electronics)
headphones_pc = ProductCategory.create(product: headphones, category: electronics)
microwave_pc = ProductCategory.create(product: microwave, category: electronics)
microwave_pc2 = ProductCategory.create(product: microwave, category: kitchen)

dish_towel_pc = ProductCategory.create(product: dish_towel, category: kitchen)
skillet_pc = ProductCategory.create(product: skillet, category: kitchen)
knife_set_pc = ProductCategory.create(product: knife_set, category: kitchen)
spice_rack_pc = ProductCategory.create(product: spice_rack, category: kitchen)
glasses_pc = ProductCategory.create(product: glasses, category: kitchen)

patio_pc = ProductCategory.create(product: patio_chair, category: outdoor)
patio_pc2 = ProductCategory.create(product: patio_chair, category: furniture)
plant_pc = ProductCategory.create(product: plant, category: outdoor)
hammock_pc = ProductCategory.create(product: hammock, category: outdoor)
garden_hose_pc = ProductCategory.create(product: garden_hose, category: outdoor)
deck_table_pc = ProductCategory.create(product: deck_table, category: outdoor)
deck_table_pc2 = ProductCategory.create(product: deck_table, category: furniture)

armchair_pc = ProductCategory.create(product: armchair, category: furniture)
nightstand_pc = ProductCategory.create(product: nightstand, category: furniture)
sofa_pc = ProductCategory.create(product: sofa, category: furniture)
coffee_table_pc = ProductCategory.create(product: coffee_table, category: furniture)
bunk_bed_pc = ProductCategory.create(product: bunk_bed, category: furniture)
bunk_bed_pc2 = ProductCategory.create(product: bunk_bed, category: children)

dress_pc = ProductCategory.create(product: dress, category: clothing)
cowboy_boots_pc = ProductCategory.create(product: cowboy_boots, category: clothing)
pants_pc = ProductCategory.create(product: pants, category: clothing)
hat_pc = ProductCategory.create(product: hat, category: clothing)
socks_pc = ProductCategory.create(product: socks, category: clothing)