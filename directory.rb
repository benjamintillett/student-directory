#!/usr/bin/env ruby
# we shebanged the file
#then we print the list of students
students = ["Javier Silverio",
"Elliot Lewis",
"Ben Tillett",
"Vincent Koch",
"Michelle Ballard",
"Nick Roberts",
"Tatiana Soukiassian",
"Mervé Silk",
"Albert Vallverdu",
"Lovis Schultze",
"Henry Stanley",
"Spike Lindsey",
"Ruth Earle",
"Andy Gates",
"Faisal Aydarus",
"Ethel Ng",
"Kevin Daniells",
"Maya Driver",
"Leopold Kwok",
"James McNeil",
"Jerome Pratt",
"David Wickes",
"Chris Oatley",
"Marc Singh"]
# and then print them
puts "The students of my cohort at Makers Academy"
puts "----------------"
students.each do |student| 
	puts student
end
#finally, we print the total
puts "Overall, we have #{students.length} great students"
