#!/usr/bin/env ruby
require 'csv'
@students = []
@student = { name: "N/A", hobby: "N/A", cohort: "N/A"}

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
	info = STDIN.gets.chomp
	info.empty? ? "N/A" : info
end

def get_student_info	
	name = get_info("name")	
	return if name == "quit"		
	hobby = get_info("hobby")
	return if hobby == "quit"
	cohort = get_info("cohort")
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
	puts "Please enter the names, hobbies and cohort of the students\nTo finish, fill in a field with quit and hit return"
	while true do
		name, hobby, cohort = get_student_info
		break if [name, hobby, cohort].any? {|value| value == nil}
		add_student_info(name, cohort, hobby)
		puts "Now we have #{@students.length} students"
	end
end

def print_header
	puts "The #{pluralize(@students.length,'student')} of my cohort at Makers Academy"
	puts "-----------------------------------"

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

def sort_students(info)
	@students.sort_by! { |student| student[info.to_sym] }
end

def print_students_by_info(info)
	puts "Showing all students sorted by #{info}"
	puts "-----------------------------------"
	sort_students(info)
	print_students_list
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
	puts "What do you want to sort by: name, cohort, hobby"
	print_students_by_info(gets.chomp.to_sym)
	print_footer
end

def process(selection)
	case selection		
		when "1" then @students = input_students
		when "2" then show_students
		when "3" then save_students
		when "4" then load_students
		when "9" then exit
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

def get_filename
	puts "please enter the file name"
	gets.chomp 
end

def save_students
	CSV.open(get_filename,"w") do |csv|
		@students.each do |student|
			csv << student.values
		end
	end
end

def load_students
	CSV.foreach(get_filename) do |line|
		name, cohort, hobby = line
		add_student_info(name, cohort, hobby)
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




