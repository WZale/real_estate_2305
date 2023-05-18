class House
  attr_reader :price, 
              :address,
              :rooms,
              :details

  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []
    @details = {"price" => @price, "address" => @address}
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500000
  end

  def rooms_from_category(category)
    @rooms.find_all { |room| room.category == category }
  end

  def area
    @rooms.sum { |room| room.area }
  end

  def price_per_square_foot
    (price / area.to_f).round(2)
  end

  def rooms_sorted_by_area
    rooms.sort_by { |room| room.area }.reverse
  end

  def rooms_by_category
    category_hash = { bedroom: [], living_room: [], basement: [] }

    @rooms.each do |room|
      if room.category == :bedroom
        category_hash[:bedroom].push(room)
      elsif room.category == :living_room
        category_hash[:living_room].push(room)
      else
        category_hash[:basement].push(room)
      end
    end
    category_hash
  end

end