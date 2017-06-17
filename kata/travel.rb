def travel(r, zipcode)
  AddressBook.new(r, zipcode).formatted
end

class AddressBook
  def initialize(r, zipcode)
    @directory = r + ','
    @zipcode = zipcode
    @addresses = get_address
  end

  def formatted
    if @zipcode.empty?
      ":/"
    else
      "#{@zipcode}:#{get_streetnames}/#{get_unit_numbers}"
    end
  end

  private

  def get_address
    regexp = '[\\w\\s.]+' + @zipcode + ','

    @directory.scan(/#{regexp}/).map do |address|
      address.gsub(',', '')
    end
  end

  def get_streetnames
    @addresses.map do |address|
      address.gsub(/\s#{@zipcode}/, '').gsub(/\d+\s/, '')
    end.join(',')
  end

  def get_unit_numbers
    @addresses.map do |address|
      address.match(/\A\d+/)
    end.join(',')
  end
end

$ad =
  "123 Main Street St. Louisville OH 43071,432 Main Long Road St. Louisville OH 43071,786 High Street Pollocksville NY 56432,"\
  "54 Holy Grail Street Niagara Town ZP 32908,3200 Main Rd. Bern AE 56210,1 Gordon St. Atlanta RE 13000,"\
  "10 Pussy Cat Rd. Chicago EX 34342,10 Gordon St. Atlanta RE 13000,58 Gordon Road Atlanta RE 13000,"\
  "22 Tokyo Av. Tedmondville SW 43098,674 Paris bd. Abbeville AA 45521,10 Surta Alley Goodtown GG 30654,"\
  "45 Holy Grail Al. Niagara Town ZP 32908,320 Main Al. Bern AE 56210,14 Gordon Park Atlanta RE 13000,"\
  "100 Pussy Cat Rd. Chicago EX 34342,2 Gordon St. Atlanta RE 13000,5 Gordon Road Atlanta RE 13000,"\
  "2200 Tokyo Av. Tedmondville SW 43098,67 Paris St. Abbeville AA 45521,11 Surta Avenue Goodtown GG 30654,"\
  "45 Holy Grail Al. Niagara Town ZP 32918,320 Main Al. Bern AE 56215,14 Gordon Park Atlanta RE 13200,"\
  "100 Pussy Cat Rd. Chicago EX 34345,2 Gordon St. Atlanta RE 13222,5 Gordon Road Atlanta RE 13001,"\
  "2200 Tokyo Av. Tedmondville SW 43198,67 Paris St. Abbeville AA 45522,11 Surta Avenue Goodville GG 30655,"\
  "2222 Tokyo Av. Tedmondville SW 43198,670 Paris St. Abbeville AA 45522,114 Surta Avenue Goodville GG 30655,"\
  "2 Holy Grail Street Niagara Town ZP 32908,3 Main Rd. Bern AE 56210,77 Gordon St. Atlanta RE 13000"


$code =
     "OH 43071,NY 56432,ZP 32908,AE 56210,RE 13000,EX 34342,SW 43098,AA 45521,GG 30654,ZP 32908,AE 56215,RE 13200,EX 34345,"\
     "RE 13222,RE 13001,SW 43198,AA 45522,GG 30655,XX 32321,YY 45098"

p travel($ad, "AA 45522") == "AA 45522:Paris St. Abbeville,Paris St. Abbeville/67,670"
p travel($ad, "EX 34342") == "EX 34342:Pussy Cat Rd. Chicago,Pussy Cat Rd. Chicago/10,100"
p travel($ad, "EX 34345") == "EX 34345:Pussy Cat Rd. Chicago/100"
p travel($ad, "AA 45521") == "AA 45521:Paris bd. Abbeville,Paris St. Abbeville/674,67"
p travel($ad, "AE 56215") == "AE 56215:Main Al. Bern/320"
p travel($ad, "AE 56215231")# == "AE 56215:Main Al. Bern/320"
p travel($ad, "")# == "AE 56215:Main Al. Bern/320"


$r = "123 Main Street St. Louisville OH 43071,432 Main Long Road St. Louisville OH 43071,786 High Street Pollocksville NY 56432,54 Holy Grail Street Niagara Town ZP 32908,3200 Main Rd. Bern AE 56210,1 Gordon St. Atlanta RE 13000,10 Pussy Cat Rd. Chicago EX 34342,10 Gordon St. Atlanta RE 13000,58 Gordon Road Atlanta RE 13000,22 Tokyo Av. Tedmondville SW 43098,674 Paris bd. Abbeville AA 45521,10 Surta Alley Goodtown GG 30654,45 Holy Grail Al. Niagara Town ZP 32908,320 Main Al. Bern AE 56210,14 Gordon Park Atlanta RE 13000,100 Pussy Cat Rd. Chicago EX 34342,2 Gordon St. Atlanta RE 13000,5 Gordon Road Atlanta RE 13000,2200 Tokyo Av. Tedmondville SW 43098,67 Paris St. Abbeville AA 45521,11 Surta Avenue Goodtown GG 30654,45 Holy Grail Al. Niagara Town ZP 32918,320 Main Al. Bern AE 56215,14 Gordon Park Atlanta RE 13200,100 Pussy Cat Rd. Chicago EX 34345,2 Gordon St. Atlanta RE 13222,5 Gordon Road Atlanta RE 13001,2200 Tokyo Av. Tedmondville SW 43198,67 Paris St. Abbeville AA 45522,11 Surta Avenue Goodville GG 30655,2222 Tokyo Av. Tedmondville SW 43198,670 Paris St. Abbeville AA 45522,114 Surta Avenue Goodville GG 30655,2 Holy Grail Street Niagara Town ZP 32908,3 Main Rd. Bern AE 56210,77 Gordon St. Atlanta RE 13000,100 Pussy Cat Rd. Chicago OH 13201"

p travel($r, "OH 430")# == "AE 56215:Main Al. Bern/320"
