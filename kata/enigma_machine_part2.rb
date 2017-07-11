class Plugboard
  def initialize(wires)
    @wires = wires
    @wire_hash = {}
    set_board
  end

  def set_board
    raise "Invalid Transaction" if @wires.empty?
    return false if @wires.length.odd?
    @wires.scan(/\w{2}/).each do |pair|
      return false if pair[0] == pair[1] || @wire_hash.key?(pair[0]) || @wire_hash.key?(pair[1])
      @wire_hash[pair[0]] = pair[1]
      @wire_hash[pair[1]] = pair[0]
    end
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
p Plugboard.new("ABCDEFGHIJKLMNOPQRT")
p Plugboard.new("AABC")
p Plugboard.new("ABAC")
p Plugboard.new("ABCD")
p Plugboard.new("")
