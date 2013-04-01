require 'rubygems'
require 'yaml'
require 'pry'


class Person
  attr_accessor :name
  attr_accessor :email
  attr_accessor :github_user
  attr_accessor :twitter
  attr_accessor :fun_fact

  #creates an instance of person type
  def self.create_person(person)
    case person
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
    super
    print "What was your reasoning for joining WDI "
    self.reason_for_joining = gets.strip.chomp
  end
end

class Instructor < Person
  attr_accessor :type

  def initialize
    #First executes method in super class
    super
    print "What type of instructor "
    self.type = gets.strip.chomp
  end
end

@directory = []
puts "Student Directory, v0.0.1 by Dan Garland"
print "Enter Student or Instructor, q to save and quit: "

while ((input = gets.strip.chomp) != 'q') do
  if input == "l"
    @directory << YAML.load_documents(File.open('student_directory.yml'))
  end

    #create instance of the person class to be added in t
    person = Person.create_person(input)
    
    print "Enter Student or Instructor, q to save and quit: "
end
# Save people to a YAML file
File.open('student_directory.yml', 'a') { |f| 
  @directory.compact.each do |person|
    f.write(person.to_yaml)
end 
}