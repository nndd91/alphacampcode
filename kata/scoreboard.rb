FOODPOINTS = { "chickenwings" => 5, "hamburgers" => 3, "hotdogs" => 2 }.freeze

def scoreboard(who_ate_what)
  hash_array =
    who_ate_what.map do |each_hash|
      total = 0
      fatty_name = ""
      each_hash.each do |food, amount|
        if FOODPOINTS.has_key?(food)
          total += FOODPOINTS[food] * amount
        else
          fatty_name = amount
        end
      end
      {"name" => fatty_name, "score" => total }
    end

  # Sort
  final_array = []
  hash_array.each do |each_hash|
    if final_array.empty?
      final_array << each_hash
    else



end

p scoreboard([{"name"=>"Billy The Beast", "chickenwings"=>17 , "hamburgers"=>7, "hotdogs"=>8},{"name"=>"Habanero Hillary", "chickenwings"=>5 , "hamburgers"=>17, "hotdogs"=>11},{"name"=>"Joey Jaws", "chickenwings"=>8, "hamburgers"=>8, "hotdogs"=>15},{"name"=>"Big Bob" , "chickenwings"=>20, "hamburgers"=>4, "hotdogs"=>11}])#, [{"name"=>"Big Bob", "score"=>134},{"name"=>"Billy The Beast", "score"=>122},{"name"=>"Habanero Hillary", "score"=>98},{"name"=>"Joey Jaws", "score"=>94}])
p scoreboard([{"name"=>"Big Bob" , "chickenwings"=>20, "hamburgers"=>4, "hotdogs"=>11}])#, [{"name"=>"Big Bob", "score"=>134}])
p scoreboard([{"name"=>"Joey Jaws", "chickenwings"=>8, "hamburgers"=>8, "hotdogs"=>15},{"name"=>"Big Bob" , "chickenwings"=>20, "hamburgers"=>4, "hotdogs"=>11}])#, [{"name"=>"Big Bob", "score"=>134},{"name"=>"Joey Jaws", "score"=>94}])
p scoreboard([{"name"=>"Joey Jaws", "chickenwings"=>0, "hamburgers"=>1, "hotdogs"=>1},{"name"=>"Big Bob" , "chickenwings"=>1, "hamburgers"=>0, "hotdogs"=>0}])#, [{"name"=>"Big Bob", "score"=>5},{"name"=>"Joey Jaws", "score"=>5}])
p scoreboard([])#, [])
