class Cat
  # code goes here
  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []

  def initialize(name, owner)
    @mood = "nervous"
    @name, @owner = name, owner
    @@all << self
  end

  def self.all
    @@all
  end 


end