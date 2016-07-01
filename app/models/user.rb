
class User
  attr_accessor :first_name, :last_name, :id, :age
  def initialize(first_name, last_name, id, age)
    @first_name = first_name
    @last_name = last_name
    @id = id
    @age = age
  end

  def User.all
    [
      User.new("Bilbo", "Baggins", "1", "111"),
      User.new("Frodo", "Baggins", "2", "50"),
      User.new("Samwise", "Gamgee", "3", "38"),
      User.new("Peregrin", "Took", "4", "28"),
      User.new("Meriadoc", "Brandybuck", "5", "36"),
      User.new("Aragorn", "Ellesar", "6", "87"),
      User.new("Legolas", "Greenleaf", "7", "2931"),
      User.new("Gimli", "SonOfGloin", "8", "139"),
      User.new("Boromir", "SonOfDenethor", "9", "41"),
      User.new("Gandalf", "theGray", "10", "2019"),
      User.new("Saruman", "theWhite", "11", "2019"),
      User.new("Sauron", "Darklord", "12", "12345"),
      User.new("Smeagol", "Gollumface", "13", "589"),
      User.new("Shelob", "Spider", "14", "1199"),
      User.new("Fingolfin", "theElf", "15", "4488"),
      User.new("Elrond", "Half-Elf", "16", "6520"),
      User.new("Melkor", "Valar", "17", "12345"),
      User.new("Manwe", "Valar", "18", "12345"),
      User.new("Aule", "Valar", "19", "12345"),
      User.new("Tom", "Bombadil", "20", "99999"),
     ]
  end

  def to_json(json_arg = nil)
     {
       first_name: @first_name,
       last_name: @last_name,
       id: @id,
       age: @age
     }.to_json
  end

end
