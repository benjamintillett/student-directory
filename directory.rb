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
@students = []

def pluralize(n,singular,plural=nil)
	if n == 1 
		"#{singular}"
	elsif plural
		"#{plural}"
	else
		"#{singular}s"
	end
end

def get_info(info)
	puts "Please enter the next students #{info}"
	temp_info = gets.gsub(/\n/,"")
	info = temp_info.empty? ? "N/A" : temp_info
	return info
end

def print_student(student,index)
	puts "#{index+1}.#{student[:name]}".center(50) + "hobby: #{student[:hobby]}".center(50) + "(#{student[:cohort]} cohort)".center(50)
end


def input_students
	puts "Please enter the names and hobbies and cohort of the students"
	puts "To finish, fill in a field with quit and hit return"
	# while the names and hobbies are not empty, repeat this code
	while true do
		name = get_info("name")
		break if name == "quit"
		
		hobby = get_info("hobby")
		break if hobby == "quit"

		cohort = get_info("cohort")
		break if cohort == "quit"
		cohort.to_sym	

		#add the student hash to the array
		@students << {:name => name, :cohort => cohort, :hobby => hobby }
		puts "Now we have #{@students.length} students"
	end
	#return the array of students
	@students
end

def print_header
	puts "The #{pluralize(@students.length,'student')} of my cohort at Makers Academy"
	puts "----------------"
end

def print_students_list1
	@students.each_with_index do |student, index|
		if student[:name].length < 12 && student[:name][0].downcase == "a"
			print_student(student,index)
		end
	end
end

def print_students_list
	index = 0
	until index == @students.length do 
		student = @students[index]
		print_student(student,index)
		index += 1 
	end
end

def print_footer
	#finally, we print the total
	puts "Overall, we have #{@students.length} great #{pluralize(@students.length,'student')}"
end

def get_cohort_list
	@students.map { |student| student[:cohort] }.uniq
end

def print_by_cohort
	cohort_list = get_cohort_list
	cohort_list.each do |cohort| 
		puts "Students in the #{cohort} cohort:  \n"
		@students.each_with_index do |student,index| 
			if student[:cohort] == cohort
				print_student(student,index)
			end
		end
	end
end	

def print_menu
	puts "1. Input the students"
	puts "2.Show the Students"
	puts "3. Save the list to students.csv"
	puts "9. Exit"
end
def show_students
	print_header
	print_students_list
	print_footer
end

def process(selection)
	case selection		
		when "1"
			@students = input_students
		when "2"
			show_students
		when "3"
			save_students
		when "9"
			exit
		else
			puts "I don't know what you meant, try again"
	end
end 

def interactive_menu 
	loop do 
		print_menu
		process(gets.chomp) 
	end
end

def save_students
	# open file for writing
	file = File.open("students.csv", "w")
	# iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort],student[:hobby]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end








#students = input_students
#print_header(students.length)
#print_students(students)
#print_footer(students)

#print_by_cohort(students)
interactive_menu

