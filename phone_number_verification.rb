class PhoneNumber
	puts "Enter numbers only"
	phone_number = gets.chomp


	black_list = ["2014687508", "1111111111", "2222222222", "1234567890"] 

	if phone_number =~ /^(?:\+?1[-.●]?)?\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$/
		if black_list.include? phone_number || phone_number.starts_with("901", "+1901", "1901") 
			puts "This number is black listed"
		else
			formated = phone_number
			nonformated =  phone_number.delete('()').delete('-').delete(".").delete("+")

			if nonformated.length >= 11
				formated = nonformated.gsub(/^(\d{4})(\d+)(\d{4})$/, '\1-\2-\3')
				formated = formated.insert(4, ")")
				formated = formated.insert(1, "(")
			else
				formated = nonformated.gsub(/^(\d{3})(\d+)(\d{4})$/, '\1-\2-\3')
				formated = formated.insert(3, ")")
				formated = formated.insert(0, "(")
			end
			puts formated
			puts nonformated
		end
	else
		puts "Please Enter only Numbers, Only 10 numbers are allowed"
	end
end

#Does not consider with spaces