class Plugboard
  def initialize(wires = "")
    @wires = wires
    @wire_hash = {}

    raise "Invalid Transaction" if invalid?
    set_board
    return @wire_hash
  end

  def set_board
    @wires.scan(/\w{2}/).each do |pair|
      raise "Invalid Transaction" if pair[0] == pair[1] || @wire_hash.key?(pair[0]) || @wire_hash.key?(pair[1])
      @wire_hash[pair[0]] = pair[1]
      @wire_hash[pair[1]] = pair[0]
    end
  end

  def invalid?
    @wires.length.odd? || @wires.length > 20
  end

  def process(wire)
    @wire_hash.key?(wire) ? @wire_hash[wire] : wire
  end
end

plugboard = Plugboard.new("ABCDEFGHIJKLMNOPQRST")
print plugboard.process("A")
print plugboard.process("B")
print plugboard.process("X")
print plugboard.process(".")
puts
p Plugboard.new("ABCDEFGHIJKLMNOPQRST")
p Plugboard.new("AABC")
p Plugboard.new("ABAC")
p Plugboard.new("ABCD")
p emptyboard = Plugboard.new("")
print emptyboard.process("A")


wirehash = {}
wire_string = "AABBCCDDEEFFGGHHIIJJKKLLMMNNOOPPQQRRSSTTUUVVWWXXYYZZ"
wire_string.scan(/\w{2}/).each do |pair|
  wirehash[pair[0]] = pair[1]
  wirehash[pair[1]] = pair[0]
end
p wirehash
