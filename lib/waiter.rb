require 'pry'
class Waiter
  attr_accessor :name, :yrs_experience
  @@all = []

  def initialize (name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all

  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select{|m| m.waiter == self}
  end


  def best_tipper
    best_tipped_meal = meals.max{|a, b| a.tip <=> b.tip}
    best_tipped_meal.customer

  end

  def worst_tipper
    worst_tipped_meal = meals.min{|a, b| a.tip <=> b.tip}
    worst_tipped_meal.customer
  end

  def most_frequent_customer
    customers = meals.map{|m| m.customer}
    customers.max_by {|customer| customers.count(customer)}
  end

  def self.average_tip_for_most_experienced_waiter
    the_most_experienced_waiter = self.all.max_by {|waiter| waiter.yrs_experience}
    a = the_most_experienced_waiter.meals.map {|m| m.tip}
    result = a.sum(0.0) / a.size
  end

  def self.average_tip_for_least_experienced_waiter
end
