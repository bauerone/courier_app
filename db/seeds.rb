courier_user = User.create!(name: 'Александр', email: 'courier@email.com', password: 'qwerty', password_confirmation: 'qwerty', role: :courier)
customer_user = User.create!(name: 'Владимир', email: 'customer@email.com', password: 'qwerty', password_confirmation: 'qwerty', role: :customer)
admin_user = User.create!(name: 'Дмитрий', email: 'admin@email.com', password: 'qwerty', password_confirmation: 'qwerty', role: :admin)

product = Product.create!(name: 'iPhone 15', price: 65_000, weight: 0.5)
order_in_delivery = Order.create!(shipping_address: 'Марьино', delivery_address: 'Братиславская', status: 1, courier: courier_user, customer: customer_user)

OrderProduct.create!(order: order_in_delivery, product: product)