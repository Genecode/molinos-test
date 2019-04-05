Admin.create!([
  {email: "test@mail.ru", encrypted_password: "$2a$11$uhZCDgsu45w4mOExCo.THu88.h2z8.HUZV1PSnr8cZDSI22oBmk22", sign_in_count: 1, current_sign_in_at: "2019-04-04 23:46:43", last_sign_in_at: "2019-04-04 23:46:43", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", failed_attempts: 0, unlock_token: nil, locked_at: nil}
])
Category.create!([
  {name: "Drinks", slug: "drinks", ancestry: nil},
  {name: "Alcohol", slug: "alcohol", ancestry: "1"},
  {name: "no alcohol", slug: "no-alcohol", ancestry: "1"}
])
Product.create!([
  {name: "Water", slug: "water", category_id: 1, description: nil},
  {name: "Vodka", slug: "vodka", category_id: 2, description: nil},
  {name: "Beer", slug: "beer", category_id: 2, description: nil},
  {name: "Pepsi", slug: "pepsi", category_id: 3, description: nil},
  {name: "Sprite", slug: "sprite", category_id: 3, description: nil}
])
