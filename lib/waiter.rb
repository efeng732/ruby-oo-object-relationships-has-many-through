class Waiter

    attr_accessor :name, :yrs_experience
  
    @@all = []
  
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
  
    def self.all
      @@all
    end

    def new_meal (customer, total, tip)
        Meal.new(self, customer, total, tip)
    end 

    def meals 
        Meal.all.select {|meals| meals.waiter == self }
    end 

    def best_tipper 
        best = meals.max do |meal_1, meal_2|
            meal_1.tip <=> meal_2.tip 
        end 
        best.customer 
    end 

  
  end 