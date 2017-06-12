def scoreboard(who_ate_what)
  glutton_array =
    who_ate_what.map do |each_hash|
      glutton = Glutton.new(each_hash.fetch('name'), each_hash.fetch('chickenwings'), each_hash.fetch('hamburgers'), each_hash.fetch('hotdogs'))
    end

  final_array =
    glutton_array.sort.reverse.map do |each_glutton|
      { "name" => each_glutton.glutton_name, "score" => each_glutton.score }
    end
end

class Glutton
  include Comparable
  FOODPOINTS = { "chickenwings" => 5, "hamburgers" => 3, "hotdogs" => 2 }.freeze

  attr_reader :score, :glutton_name

  def initialize(glutton_name, chickenwings, hamburgers, hotdogs)
    @glutton_name = glutton_name
    @chickenwings = chickenwings
    @hamburgers = hamburgers
    @hotdogs = hotdogs
    calculate_score
  end

  private

  def calculate_score
    @score = @chickenwings * FOODPOINTS['chickenwings'] + @hamburgers * FOODPOINTS['hamburgers'] + @hotdogs * FOODPOINTS['hotdogs']
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

p scoreboard([{"name"=>"Billy The Beast", "chickenwings"=>17 , "hamburgers"=>7, "hotdogs"=>8},{"name"=>"Habanero Hillary", "chickenwings"=>5 , "hamburgers"=>17, "hotdogs"=>11},{"name"=>"Joey Jaws", "chickenwings"=>8, "hamburgers"=>8, "hotdogs"=>15},{"name"=>"Big Bob" , "chickenwings"=>20, "hamburgers"=>4, "hotdogs"=>11}])#, [{"name"=>"Big Bob", "score"=>134},{"name"=>"Billy The Beast", "score"=>122},{"name"=>"Habanero Hillary", "score"=>98},{"name"=>"Joey Jaws", "score"=>94}])
p scoreboard([{"name"=>"Big Bob" , "chickenwings"=>20, "hamburgers"=>4, "hotdogs"=>11}])#, [{"name"=>"Big Bob", "score"=>134}])
p scoreboard([{"name"=>"Joey Jaws", "chickenwings"=>8, "hamburgers"=>8, "hotdogs"=>15},{"name"=>"Big Bob" , "chickenwings"=>20, "hamburgers"=>4, "hotdogs"=>11}])#, [{"name"=>"Big Bob", "score"=>134},{"name"=>"Joey Jaws", "score"=>94}])
p scoreboard([{"name"=>"Joey Jaws", "chickenwings"=>0, "hamburgers"=>1, "hotdogs"=>1},{"name"=>"Big Bob" , "chickenwings"=>1, "hamburgers"=>0, "hotdogs"=>0}])#, [{"name"=>"Big Bob", "score"=>5},{"name"=>"Joey Jaws", "score"=>5}])
p scoreboard([])#, [])
