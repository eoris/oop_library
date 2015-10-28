class Reader
  attr_accessor :name, :city, :street, :house, :email

  def initialize(name, city, street, house, email = "")
    @name   = name
    @city   = city
    @street = street
    @house  = house
    @email  = email
  end

  def to_s
    "Name: #{@name},\ne-mail: #{@email},\nCity: #{@city},\nStreet: #{@street},\nHouse: № #{@house}"
  end

end