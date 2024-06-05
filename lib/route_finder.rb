require 'watir'

class RouteFinder
  def initialize(order:, start_address:)
    @start_address = start_address
    @storage_addresses = order.courier_checkpoints
    @finish_address = order.delivery_address
  end

  def find_all_route_combinations
    start = @start_address
    storages = @storage_addresses
    finish = @finish_address

    permutations = storages.permutation(storages.size).to_a

    permutations.map! { |permutation| permutation.prepend(start).append(finish) }
  end

  def find_optimal_route
    calculate_duration
  end

  def calculate_duration
    browser = Watir::Browser.new

    routes = find_all_route_combinations.map do |route|

      checkpoint_durations = make_route_pairs(route).map! do |departure, destination|
        browser.goto('yandex.ru/maps/213/moscow/?ll=37.617700%2C55.755863&mode=routes&rtext=&rtt=auto&z=10')

        from = browser.text_field(placeholder: 'Откуда')
        where = browser.text_field(placeholder: 'Куда')

        from.set(departure)
        browser.send_keys :enter

        where.set(destination)
        browser.send_keys :enter

        route_duration = browser.div(class: 'auto-route-snippet-view__route-duration').text

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

        [departure, destination, route_time_to_minutes(route_time)]
      end

      {
        complete_route: route,
        total_time: checkpoint_durations.sum { |_, _, minutes| minutes },
        checkpoints: checkpoint_durations
      }
    end

    browser.close

    routes.min_by { |route| route[:total_time] }
  end

  def show_result_route(route)
    route[:checkpoints].each do |departure, destination, _|
      browser = Watir::Browser.new

      browser.goto('yandex.ru/maps/213/moscow/?ll=37.617700%2C55.755863&mode=routes&rtext=&rtt=auto&z=10')

      from = browser.text_field(placeholder: 'Откуда')
      where = browser.text_field(placeholder: 'Куда')

      from.set(departure)
      browser.send_keys :enter

      where.set(destination)
      browser.send_keys :enter
    end
  end

  private

  def make_route_pairs(combination)
    (0...combination.size - 1).map { |idx| [combination[idx], combination[idx + 1]]}
  end

  def route_time_to_minutes(duration)
    duration.map do |k, v|
      case k
      when :days
        v.to_i * 24 * 60
      when :hours
        v.to_i * 60
      when :minutes
        v.to_i
      else
        nil
      end
    end.sum
  end
end
