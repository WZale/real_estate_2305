require './lib/room'
require './lib/house'

RSpec.describe House do
  before(:each) do
    @house = House.new("$400000", "123 sugar lane")
    
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15') 
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')
  end

  describe "Iteration 2" do
    it "exists with readable attributes" do
      expect(@house).to be_an_instance_of(House)
      expect(@house.price).to eq(400000)
      expect(@house.address).to eq("123 sugar lane")
      expect(@house.rooms).to eq([])
    end
    
    it "has an add_rooms method" do
      expect(@house.rooms).to eq([])
      
      @house.add_room(@room_1)
      @house.add_room(@room_2)
      
      expect(@house.rooms).to eq([@room_1, @room_2])
    end
  end
  
  describe "Iteration 3" do
    it "has an above_market_average? method" do
      expect(@house.above_market_average?).to eq(false)
    end
    
    it "has a rooms_from_category method" do
      @house.add_room(@room_1)
      @house.add_room(@room_2)
      @house.add_room(@room_3)
      @house.add_room(@room_4)
      
      expect(@house.rooms_from_category(:bedroom)).to eq([@room_1, @room_2])
    end

    it "has an area method" do
      @house.add_room(@room_1)
      @house.add_room(@room_2)
      @house.add_room(@room_3)
      @house.add_room(@room_4)
      
      expect(@house.area).to eq(1900)
    end

    it "has a details method" do
      @house.add_room(@room_1)
      @house.add_room(@room_2)
      @house.add_room(@room_3)
      @house.add_room(@room_4)
      
      expect(@house.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
    end
  end
end