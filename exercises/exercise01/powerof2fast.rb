#Code from Pavel

def is_power_of_two?(num)
	num.to_s(2).count("1") == 1
end

p is_power_of_two?(16)