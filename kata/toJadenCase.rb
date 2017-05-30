class String
  def toJadenCase
    str = self.split(" ").map(&:capitalize).join(" ")
  end
end

str = "How can mirrors be real if our eyes aren't real";
p str.toJadenCase() #-> "How Can Mirrors Be Real If Our Eyes Aren't Real"
