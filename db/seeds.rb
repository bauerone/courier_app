courier_user = User.create!(name: 'Александр', email: 'courier@email.com', password: 'qwerty', password_confirmation: 'qwerty', role: :courier)
customer_user = User.create!(name: 'Владимир', email: 'customer@email.com', password: 'qwerty', password_confirmation: 'qwerty', role: :customer)
User.create!(name: 'Дмитрий', email: 'admin@email.com', password: 'qwerty', password_confirmation: 'qwerty', role: :admin)

storage_bauman = Storage.create!(name: 'Склад на Бауманской', address: 'Бауманская')
storage_frunze = Storage.create!(name: 'Склад на Фрунзенской', address: 'Фрунзенская')

product_iphone = Product.create!(name: 'iPhone 15', price: 65_000, weight: 0.5, storage: storage_bauman)
product_ipad = Product.create!(name: 'iPad Pro 13-inch', price: 120_000, weight: 0.6, storage: storage_frunze)

order_in_delivery = Order.create!(delivery_address: 'Братиславская', status: 1, courier: courier_user, customer: customer_user)

OrderProduct.create!(order: order_in_delivery, product: product_iphone)
OrderProduct.create!(order: order_in_delivery, product: product_ipad)