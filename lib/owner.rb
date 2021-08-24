
class Owner
  # code goes here
  attr_reader :name, :species 

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end
  
  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end


  # associations
  def cats
    Cat.all.filter{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.filter{|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end

  def sell_pets
    pets = [self.dogs, self.cats].flatten

    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil

    end
  end


end