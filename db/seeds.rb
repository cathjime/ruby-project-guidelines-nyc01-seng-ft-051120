
Product.delete_all
Category.delete_all
ProductCategory.delete_all
User.delete_all

#Category
children = Category.create(name: "Children")
kitchen = Category.create(name: "Kitchen")
outdoor = Category.create(name: "Outdoor")
electronics = Category.create(name: "Electronics")
clothing = Category.create(name: "Clothing")
furniture = Category.create(name: "Furniture")

#Product
ball = Product.create(name:"Ball", price:2.99 , tagline:"Bouncy fun for all ages!")
doll = Product.create(name:"Doll", price:12.99 , tagline: "Play pretend!")
rocking_horse = Product.create(name:"Rocking Horse", price:79.99 , tagline: "Giddyup!")
legos = Product.create(name:"Legos", price:45.06 , tagline: "Build fun structures!")
ps4 = Product.create(name:"PlayStation 4", price:200.29 , tagline: "Hours of Gaming!")

blender = Product.create(name:"Blender", price:29.99 , tagline: "Make delicous smoothies!")
tv = Product.create(name:"Television", price:315.65 , tagline: "HD Widescreen!")
charger = Product.create(name:"Charger", price:19.99 , tagline: "Rapid charge!")
headphones = Product.create(name:"Headphones", price:60.78 , tagline: "Bluetooth!")
microwave = Product.create(name:"Microwave", price:89.99 , tagline: "Heat up meals!")

dish_towel = Product.create(name:"Dish Towel", price:2.99 , tagline: "Keep clean in the kitchen!")
skillet = Product.create(name:"Skillet", price:14.99 , tagline: "pancake dreams!")
knife_set = Product.create(name:"Knife Set", price:65.79 , tagline: "Sharp!")
spice_rack = Product.create(name:"Spice Rack", price:40.86 , tagline: "Keep your spices organized!")
glasses = Product.create(name:"Drinking Glasses", price:20.79 , tagline: "Looks like real crystal!")

patio_chair = Product.create(name:"Patio Chair", price:50.34 , tagline: "Relax outdoors!")
plant = Product.create(name:"Plant", price:10.57 , tagline: "Add greenery!")
hammock = Product.create(name:"Hammock", price:50.89 , tagline: "Hang around!")
deck_table = Product.create(name:"Deck Table", price:250.98 , tagline: "Enjoy the deck!")
garden_hose = Product.create(name:"Garden Hose", price:29.85 , tagline: "Water your garden!")

armchair = Product.create(name:"Armchair", price:64.21 , tagline: "Cozy!")
nightstand = Product.create(name:"Night Stand", price:29.85 , tagline: "Perfect for the small things!")
bunk_bed = Product.create(name:"Bunk Bed", price:395.43 , tagline: "Two kids, half the space!")
coffee_table = Product.create(name:"Coffee Table", price:79.85 , tagline: "Display your magazines!")
sofa = Product.create(name:"Sofa", price:765.01 , tagline: "Stain resistant!")

dress = Product.create(name:"Dress", price:55.06 , tagline: "Dress it up or dress it down!")
cowboy_boots = Product.create(name:"Red Cowboy Boots", price:45.89 , tagline: "Yee haw!")
pants = Product.create(name:"Office Pants", price:115.89 , tagline: "Slim cut")
hat = Product.create(name:"Blue Beret", price:21.78 , tagline: "Affordable French fashion!")
socks = Product.create(name:"Socks", price:5.45 , tagline: "Fuzzy socks, warm feet!")

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

#User
pam = User.create(name: "pam")
michael = User.create(name: "michael")
dwight = User.create(name: "dwight")