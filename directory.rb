#!/usr/bin/env ruby

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
	temp_info = STDIN.gets.gsub(/\n/,"")
	info = temp_info.empty? ? "N/A" : temp_info
	return info
end

def get_student_info	
	name = get_info("name")	
	return if name == "quit"		
	hobby = get_info("hobby")
	return if hobby == "quit"
	cohort = get_info("cohort").to_sym
	return if cohort == "quit"
	[name, hobby, cohort]
end

def add_student_info(name, cohort, hobby)
	@students << { :name => name, :cohort => cohort.to_sym, :hobby => hobby }
end


def print_student(student,index)
	puts "#{index+1}.#{student[:name]}".center(50) + "hobby: #{student[:hobby]}".center(50) + "(#{student[:cohort]} cohort)".center(50)
end


def input_students
	puts "Please enter the names, hobbies and cohort of the students"
	puts "To finish, fill in a field with quit and hit return"
	while true do
		name, hobby, cohort = get_student_info
		break if [name, hobby, cohort].any? {|value| value == nil}
		add_student_info(name, cohort, hobby)
		puts "Now we have #{@students.length} students"
	end
	#return the array of students
	@students
end

def print_header
	puts "The #{pluralize(@students.length,'student')} of my cohort at Makers Academy"
	puts "----------------"
end

def print_students_list
	@students.each_with_index do |student, index|
		print_student(student,index)		
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
	puts "2. Show the Students"
	puts "3. Save the list to students.csv"
	puts "4. Load Students from students.csv"
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
		when "4"
			load_students
		when "9"
			exit
		else
			puts "I don't know what you meant, try again"
	end
end 

def interactive_menu 
	loop do 
		print_menu
		process(STDIN.gets.chomp) 
	end
end

def save_students
	# open file for writing
	File.open("students.csv", "w") do |file|
		# iterate over the array of students
		@students.each do |student|
			student_data = [student[:name], student[:cohort],student[:hobby]]
			csv_line = student_data.join(",")
			file.puts csv_line
		end
	end
end

def load_students(filename = "students.csv")
	File.open(filename, "r"). do |file|
		file.readlines.each do |line|
			name, cohort, hobby = line.chomp.split(",")
			add_student_info(name, cohort, hobby)
		end
	end
end

def try_load_students
	filename = ARGV.first #first argument read from the command line
	return if filename.nil? #get out of the method if it isn't given
	if File.exists?(filename) # if it exists 
		load_students(filename)
	else # if it doesn't exist
		puts "Sorry, #{filename} doesn't exist."
		exit # quit the program
	end
end 

try_load_students
interactive_menu

