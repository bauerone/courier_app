courier_user = User.create!(name: 'Александр', email: 'courier@email.com', password: 'qwerty', password_confirmation: 'qwerty', role: :courier)
customer_user = User.create!(name: 'Владимир', email: 'customer@email.com', password: 'qwerty', password_confirmation: 'qwerty', role: :customer)
admin_user = User.create!(name: 'Дмитрий', email: 'admin@email.com', password: 'qwerty', password_confirmation: 'qwerty', role: :admin)

storage = Storage.create!(name: 'Склад на Бауманской', address: 'Бауманская')

product = Product.create!(name: 'iPhone 15', price: 65_000, weight: 0.5, storage: storage)
order_in_delivery = Order.create!(delivery_address: 'Братиславская', status: 1, courier: courier_user, customer: customer_user)

OrderProduct.create!(order: order_in_delivery, product: product)