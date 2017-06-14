def driver(data)
  DriverLicense.new(data).generate
end

class DriverLicense
  require 'date'

  def initialize(details_array)
    @forename = details_array[0]
    @middle_name = details_array[1]
    @surname = details_array[2]
    @dob = Date.parse(details_array[3])
    @gender = details_array[4]
  end

  def generate
    one_to_five + six + seven_to_eight + nine_to_ten + eleven + twelve_to_thirteen + lastthree
  end

  private

  def one_to_five
    @surname[0..4].ljust(5, '9').upcase
  end

  def six
    @dob.year.to_s[2]
  end

  def seven_to_eight
    @gender == "M" ? @dob.month.to_s.rjust(2, "0") : (@dob.month + 50).to_s
  end

  def nine_to_ten
    @dob.day.to_s.rjust(2, "0")
  end

  def eleven
    @dob.year.to_s[3]
  end

  def twelve_to_thirteen
    @forename[0] + (@middle_name.empty? ? '9' : @middle_name[0])
  end

  def lastthree
    '9AA'
  end
end


# 1–5: The first five characters of the surname (padded with 9s if less than 5 characters)
# 6: The decade digit from the year of birth (e.g. for 1987 it would be 8)
# 7–8: The month of birth (7th character incremented by 5 if driver is female i.e. 51–62 instead of 01–12)
# 9–10: The date within the month of birth
# 11: The year digit from the year of birth (e.g. for 1987 it would be 7)
# 12–13: The first two initials of the first name and middle name, padded with a 9 if no middle name
# 14: Arbitrary digit – usually 9, but decremented to differentiate drivers with the first 13 characters in common. We will always use 9
# 15–16: Two computer check digits. We will always use "AA"


data = ["John","James","Smith","01-Jan-2000","M"]
puts driver(data) == "SMITH001010JJ9AA"
data = ["Johanna","","Gibbs","13-Dec-1981","F"]
puts driver(data) == "GIBBS862131J99AA"
data = ["Andrew","Robert","Lee","02-September-1981","M"]
puts driver(data) == "LEE99809021AR9AA"
