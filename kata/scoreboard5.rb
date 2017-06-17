def scoreboard(who_ate_what)
  eat = Eat.new(who_ate_what)
  eat.calculate
  eat.sort_results
end

class Eat

  CHICKEN = 5.freeze
  HAMBURGER = 3.freeze
  HOTDOG = 2.freeze

  def initialize(who_ate_what)
    @contestants = who_ate_what
  end

  def calculate
    @contestants.map do |contestant|
        name = contestant["name"]
        score = (contestant["chickenwings"] * CHICKEN) + (contestant["hamburgers"] * HAMBURGER) + (contestant["hotdogs"] * HOTDOG)
        {"name" => name, "score" => score}
    end
  end

  def sort_results
    # @results.sort_by { |x| [x.name, x.score] }

    @results.sort do |a, b|
      if a["score"] == b["score"]
        a["name"] <=> b["name"]
      else
        b["score"] <=> a["score"]
      end
    end
  end

end

p scoreboard([{"name"=>"Big Bob" , "chickenwings"=>20, "hamburgers"=>4, "hotdogs"=>11}])
# [{"name"=>"Big Bob", "score"=>134}])
p scoreboard([{"name"=>"Joey Jaws", "chickenwings"=>8, "hamburgers"=>8, "hotdogs"=>15},{"name"=>"Big Bob" , "chickenwings"=>20, "hamburgers"=>4, "hotdogs"=>11}])
# [{"name"=>"Big Bob", "score"=>134},{"name"=>"Joey Jaws", "score"=>94}])
