require 'watir'

class RouteFinder
  def initialize(order)
    @storage_addresses = order.courier_checkpoints
    @final_destination = order.delivery_address
  end

  def calculate_duration
    browser = Watir::Browser.new

    browser.goto('yandex.ru/maps/213/moscow/?ll=37.617700%2C55.755863&mode=routes&rtext=&rtt=auto&z=10')

    from = browser.text_field(placeholder: 'Откуда')
    where = browser.text_field(placeholder: 'Куда')

    from.set('Верхние поля, 28')
    browser.send_keys :enter

    where.set('Бауманская улица, 13с1')
    browser.send_keys :enter

    route_duration = browser.div(class: 'auto-route-snippet-view__route-duration').text
    # arrival_time = browser.div(class: 'auto-route-snippet-view__arrival').text

    time_array = route_duration.scan(/\d+/)

    route_time = case time_array.size
                 when 1
                   {
                     minutes: time_array[0]
                   }
                 when 2
                   {
                     hours: time_array[0],
                     minutes: time_array[1]
                   }
                 when 3
                   {
                     days: time_array[0],
                     hours: time_array[1],
                     minutes: time_array[2]
                   }
                 else
                   nil
                 end

    browser.close

    route_time
  end
end
