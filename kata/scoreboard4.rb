def scoreboard(who_ate_what)
  Competition.new(who_ate_what).final_score
end

class Competition
  def initialize(who_ate_what)
    @glutton_array = populate_glutton(who_ate_what)
  end

  def populate_glutton(who_ate_what)
    who_ate_what.map do |each_hash|
      glutton = Glutton.new(each_hash)
    end
  end

  def final_score
    @glutton_array.sort.reverse.map do |each_glutton|
      { "name" => each_glutton.glutton_name, "score" => each_glutton.score }
    end
  end
end

class Glutton
  FOODPOINTS = { "chickenwings" => 5, "hamburgers" => 3, "hotdogs" => 2 }.freeze

  attr_reader :score, :glutton_name
  attr_accessor :chickenwings, :hamburgers, :hotdogs

  def initialize(glutton_hash)
    @glutton_name = glutton_hash.fetch('name')
    @chickenwings = glutton_hash.fetch('chickenwings', 0)
    @hamburgers = glutton_hash.fetch('hamburgers', 0)
    @hotdogs = glutton_hash.fetch('hotdogs', 0)
    calculate_score
  end

  private

  def calculate_score
    @score = (@chickenwings * FOODPOINTS['chickenwings']) +
             (@hamburgers * FOODPOINTS['hamburgers']) +
             (@hotdogs * FOODPOINTS['hotdogs'])
  end

  def <=>(another)
    if score == another.score
      return -1 if glutton_name > another.glutton_name
      return 0 if glutton_name == another.glutton_name
      return 1 if glutton_name < another.glutton_name
    else
      score <=> another.score
    end
  end
end

# p scoreboard([{"name"=>"Billy The Beast", "chickenwings"=>17 , "hamburgers"=>7, "hotdogs"=>8},{"name"=>"Habanero Hillary", "chickenwings"=>5 , "hamburgers"=>17, "hotdogs"=>11},{"name"=>"Joey Jaws", "chickenwings"=>8, "hamburgers"=>8, "hotdogs"=>15},{"name"=>"Big Bob" , "chickenwings"=>20, "hamburgers"=>4, "hotdogs"=>11}])#, [{"name"=>"Big Bob", "score"=>134},{"name"=>"Billy The Beast", "score"=>122},{"name"=>"Habanero Hillary", "score"=>98},{"name"=>"Joey Jaws", "score"=>94}])
# p scoreboard([{"name"=>"Big Bob" , "chickenwings"=>20, "hamburgers"=>4, "hotdogs"=>11}])#, [{"name"=>"Big Bob", "score"=>134}])
# p scoreboard([{"name"=>"Joey Jaws", "chickenwings"=>8, "hamburgers"=>8, "hotdogs"=>15},{"name"=>"Big Bob" , "chickenwings"=>20, "hamburgers"=>4, "hotdogs"=>11}])#, [{"name"=>"Big Bob", "score"=>134},{"name"=>"Joey Jaws", "score"=>94}])
# p scoreboard([{"name"=>"Joey Jaws", "chickenwings"=>0, "hamburgers"=>1, "hotdogs"=>1},{"name"=>"Big Bob" , "chickenwings"=>1, "hamburgers"=>0, "hotdogs"=>0}])#, [{"name"=>"Big Bob", "score"=>5},{"name"=>"Joey Jaws", "score"=>5}])
# p scoreboard([])#, [])
p scoreboard([{"name"=>"T800", "chickenwings"=>6, "hamburgers"=>1}, {"name"=>"T-X", "chickenwings"=>10, "hotdogs"=>7}, {"name"=>"John Connor", "hotdogs"=>7}, {"name"=>"Dr. Peter Silberman", "chickenwings"=>8, "hamburgers"=>1, "hotdogs"=>4}, {"name"=>"Sarah Connor", "hamburgers"=>6}])
