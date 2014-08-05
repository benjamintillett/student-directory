#!/usr/bin/env ruby
# we shebanged the file
#then we print the list of students
old_students = [
	{:name => "Javier Silverio", :cohort => :august},
	{:name => "Elliot Lewis", :cohort => :august},
	{:name => "Ben Tillett", :cohort => :august},
	{:name => "Vincent Koch", :cohort => :august},
	{:name => "Michelle Ballard", :cohort => :august},
	{:name => "Nick Roberts", :cohort => :august},
	{:name => "Tatiana Soukiassian", :cohort => :august},
	{:name => "Mervé Silk", :cohort => :august},
	{:name => "Albert Vallverdu", :cohort => :august},
	{:name => "Lovis Schultze", :cohort => :august},
	{:name => "Henry Stanley", :cohort => :august},
	{:name => "Spike Lindsey", :cohort => :august},
	{:name => "Ruth Earle", :cohort => :august},
	{:name => "Andy Gates", :cohort => :august},
	{:name => "Faisal Aydarus", :cohort => :august},
	{:name => "Ethel Ng", :cohort => :august},
	{:name => "Kevin Daniells", :cohort => :august},
	{:name => "Maya Driver", :cohort => :august},
	{:name => "Leopold Kwok", :cohort => :august},
	{:name => "James McNeil", :cohort => :august},
	{:name => "Jerome Pratt", :cohort => :august},
	{:name => "David Wickes", :cohort => :august},
	{:name => "Chris Oatley", :cohort => :august},
	{:name => "Marc Singh", :cohort => :august},
]
# and then print them
def input_students
	puts "Please enter the names and hobbies and cohort of the students"
	puts "To finish, type quit and hit return twice"
	# create an empty array
	students = []
	# get the first name
	name = gets.chomp
	puts "Please enter his/her hobbie"
	hobby = gets.chomp
	puts "Please enter his/her cohort"
	cohort = gets.chomp
	# while the names and hobbies are not empty, repeat this code
	while !name.empty? || !hobby.empty? do
		#add the student hash to the array
		students << {:name => name, :cohort => cohort, :hobby => hobby }
		puts "Now we have #{students.length} students"
		puts "Please enter the next students name"
		name = gets.chomp
		break if name.empty?
		puts "Please enter his/her hobby"
		hobby = gets.chomp
		break if hobby.empty?
		puts "Please enter his/her cohort"
		cohort = gets.chomp
	end
	#return the array of students
	students
end

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "----------------"
end

def print(students)
	students.each_with_index do |student, index|
		if student[:name].length < 12 && student[:name][0].downcase == "a"
			puts "#{index+1}.#{student[:name]}, hobby: #{student[:hobby]} (#{student[:cohort]} cohort)"
		end
	end
end

def print2(students)
	index = 0
	until index == students.length do 
		#if student[:name].length < 12 && student[:name][0].downcase == "a"
			student = students[index]
			puts "#{index+1}.#{student[:name]}".center(50) + "hobby: #{student[:hobby]}".center(50) + "(#{student[:cohort]} cohort)".center(50)
		#end
		index += 1 
	end
end

def print_footer(names)
	#finally, we print the total
	puts "Overall, we have #{names.length} great students"
end

#print_header
#print(students)
#print_footer(students)

students = input_students
print_header
print2(students)
print_footer(students)

# 

