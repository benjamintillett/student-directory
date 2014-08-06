#!/usr/bin/env ruby

def print_header(students)
  puts "The students of my cohort at Makers Academy" unless students.empty?
  puts "-------------" unless students.empty?
end

def print(students)

    students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" } unless students.empty?
end

def print_footer(names)
  puts "Overall, we have #{names.length} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << { :name => name, :cohort => :november }    
    puts "Now we have #{students.length} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

students = input_students
print_header(students)
print(students)
print_footer(students)