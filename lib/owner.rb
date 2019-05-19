
require "pry"
class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a human."
  end

  def buy_fish(name)
    pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    pets.each do |pet, species|
      species.each do |specie|
        specie.mood = "nervous"
      end
    end
    pets.clear
  end

#binding.pry

  def list_pets
    pet_list = []
    pets.each do |pet, species|
      if species == pets[:fishes]
        pet_list << "#{pets[:fishes].count} fish"
      elsif species == pets[:dogs]
        pet_list << "#{pets[:dogs].count} dog(s)"
      elsif species == pets[:cats]
        pet_list << "#{pets[:cats].count} cat(s)"
      end
    end
    "I have #{pet_list.join(", ").insert(-10, " and")}."
  end

end
