Cart.create!([
  {tab_id: nil},
  {tab_id: nil},
  {tab_id: 2},
  {tab_id: 2},
  {tab_id: nil},
  {tab_id: nil},
  {tab_id: 3},
  {tab_id: nil}
])
Item.create!([
  {title: "Oven Roasted Chicken", description: "\r\nThe Oven Roasted Chicken you love is piled high atop freshly baked bread with your favorite toppings from spicy jalapenos to crisp green peppers.", image_url: nil, price: "4.5", menu_id: 1, image_file_name: "ovenroasted_subway.jpeg", image_content_type: "image/jpeg", image_file_size: 8774, image_updated_at: "2015-11-04 20:06:30"},
  {title: "Vegan", description: "Shakahari", image_url: "abc.jpg", price: "812.3", menu_id: 2, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil}
])
LineItem.create!([
  {item_id: 3, cart_id: 1, quantity: 1},
  {item_id: 3, cart_id: 3, quantity: 1},
  {item_id: 4, cart_id: 5, quantity: 1}
])
Menu.create!([
  {restaurant_id: 1, title: "Sandwiches", description: "Different kinds of breads to suit your choice"},
  {restaurant_id: 4, title: "Chicken Egg Roll", description: "chicken egg rolls are prepared with a mixture of cabbage, carrots, mushrooms, green onions and marinated chicken wrapped in a thin wonton wrapper and cooked to a golden brown."},
  {restaurant_id: 8, title: "New York Cheese Pizza", description: "When it comes to our classic XL New York cheese pizza, whole milk mozz is the secret to the stretch!"}
])
Restaurant.create!([
  {name: "Subway", image_url: nil, description: "Fast Food!", address: "Westwood", city: "LA", zip_code: 90024, tell: "1234567890", owner_id: 1, image_file_name: "subway.jpg", image_content_type: "image/jpeg", image_file_size: 957909, image_updated_at: "2015-11-05 06:14:31"},
  {name: "Panda Express", image_url: nil, description: "Panda Express is America's favorite Chinese restaurant, serving fresh and fast Chinese food for over 30 years.", address: "UCLA Ackerman Union", city: "Los Angeles", zip_code: 90024, tell: "0987654321", owner_id: 2, image_file_name: "panda_express.jpg", image_content_type: "image/jpeg", image_file_size: 5402730, image_updated_at: "2015-11-04 23:07:27"},
  {name: "Sbarro", image_url: nil, description: "The Sbarro family emigrated from Naples in 1956 and brought the best of Italy with them. Today, Sbarro serves handmade NY Pizza in 800 locations worldwide.", address: "UCLA Ackerman Union", city: "Los Angeles", zip_code: 90024, tell: "1234567890", owner_id: 3, image_file_name: "sbarro.jpg", image_content_type: "image/jpeg", image_file_size: 4953526, image_updated_at: "2015-11-05 00:54:14"}
])
Table.create!([
  {name: "1", restaurant_id: 1}
])
