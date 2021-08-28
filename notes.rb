# Gain proficiency instantiating a class
# Gain ability to discern when to implement attr_accessor, attr_reader, and attr_writer
# Gain ability to discern when to define your own attr_reader (getter) and attr_writer (setter) methods

# Note on Notation 
# You'll see notation used to represent instance methods and class methods 
# ClassName#method_name: represents an instance method that can be called on the class 

#ClassName.method_name: represents a class method that can be called on the class

# EX: Person#name is an instance method, that we can call on an instance of a class
class Person 
    def name 
        @name 
    end 
end

# We can also define this method using macro 
class Person 
    attr_reader :name 
end

# Person.new is an example of a class method 
# Remember, to create a new instance of the class, we call ClassName.new 
# which then calls the instance method ClassName#initialize 

