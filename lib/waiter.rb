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
    # customers_count = Hash.new(0)
    # customers.each {|customer| customers_count[customer] += 1}
    # customers_count.sort_by{|customer, occurences| occurences}.last[0]
    customers.max_by {|customer| customers.count(customer)}

  end

end
