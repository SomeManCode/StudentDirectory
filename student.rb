require 'rubygems'
require 'yaml'


class Person
  attr_accessor :name
  attr_accessor :email
  attr_accessor :github_user
  attr_accessor :twitter
  attr_accessor :fun_fact

  #creates an instance of person type
  def create_person(type)
    case type
    when "Student"
      Student.new
    when "Instructor"
      Instructor.new
    else
      nil
    end
  end

  def initialize
    print "What is your name? "
    self.name = gets.strip.chomp
    print "What is your email? "
    self.email = gets.strip.chomp
    print "What is your git hub account? "
    self.email = gets.strip.chomp
    print "What is your twitter account? "
    self.twitter = gets.strip.chomp
    print "Whats a fun fact about yourself? "
    self.fun_fact = gets.strip.chomp
  end

end


class Student < Person
  attr_accessor :reason_for_joining

  def initialize
    #First executes method in super class
    print "What was your reasoning for joining WDI "
    self.reason_for_joining = gets.strip.chomp
  end
end

class Instructor < Person
  attr_accessor :type

  def initialize
    #First executes method in super class
    print "What type of instructor "
    self.type = gets.strip.chomp
  end
end

@directory = ""
puts "Student Directory, v0.0.1 by Dan Garland"
print "Enter Student or Instructor, q to save and quit: "

while ((input = gets.strip.chomp) != 'q') do

  #create instance of the person class to be added in t
  person = Person.new.create_person(input)

  @directory += person.to_yaml
  puts @directory
  
  print "Enter Student or Instructor, q to save and quit: "
end

# Open a student_directory.yml YAML file and write it out on one line
File.open('student_directory.yml', 'a') { |f| f.write(@directory) } 
