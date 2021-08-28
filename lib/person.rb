# Practice OOP 
# create a Person class 
# Each instance of the Person class will have the ability to 
# Get paid/receive payments, take a bath, call a friend, start a converstation, 
# state if they are happy or clean 

#name=: new person instance cannot overwrite the name they were instantiated with 
# making it an attr_reader (a setter method) def name/@name/end makes it so that the name cannot be overwritten
# Below would be the code you would use to overwrite the name (getter method/attr_writer)
    #def name=(name)
    #    @name = name
    #end
class Person 
    attr_accessor :bank_account, :hygiene
    attr_reader :name, :happiness

    def initialize(name)
        @name = name 
        # a new person instance is initialized with a bank_account balance of $25 
        @bank_account = 25
        # a new person instance is initialized with happiness of 8 
        @happiness = 8 
        # a new person instance is initialized with a hygiene of 8 
        @hygiene = 8
    end 

    # #happiness= (means an instance method) (getter method/attr_writer)
    # does not allow a person to change their happiness above 10 or below 0
    def happiness=(num)
        @happiness = 
            if num > 10 
                10 
            elsif num < 0 
                0 
            else
                num 
            end
            # with clamp 
            # @happiness = num.clamp(0, 10)
        end
    
    # #hygiene= (instance method) (getter method/attr_writer)
    # does not allow a person to change their hygene above 10 or below 0
    def hygiene=(num)
        @hygiene = 
            if num > 10 
                10 
            elsif num < 0 
                0 
            else
                num 
            end
            # with clamp 
            # @hygiene = num.clamp(0, 10)
        end

    # #happy? returns true if happiness is greater then seven, else false 
    def happy?
        self.happiness > 7
    end

    # #clean? returns true if hyiene is greater than seven, false if hygiene is not greater than 7
    def clean? 
        self.hygiene > 7 
    end

    # #get_paid: accepts an argument of amount, icrements bank_account by the amount, returns "all about the benjamins"
    def get_paid(amount)
        self.bank_account += amount 
         "all about the benjamins" 
    end

    # #take_bath: 
    #   makes the person cleaner by 4 points 
    #   returns a song 
    #   can't make a person cleaner by 10 (use the custom hygiene=method)
    #   calls on the #hygiene= method to increment hygiene
    def take_bath 
        self.hygiene += 4
         "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    # #work_out 
    #   makes a person dirtier by 3 points 
    #    never makes the person have negative dirty points (hint: use the #hygiene= method)
    #    calls on the #hygiene= method to decrease hygiene
    #    makes the person happier by 2 points
    #   never makes the person have more than 10 happiness points (hint: use the #happiness= method)
    #    calls on the #happiness= method to increment happiness 
    #    returns Queen lyrics
    def work_out 
        self.happiness += 2
        self.hygiene -= 3 
         "♪ another one bites the dust ♫"
    end

    # #call_friend accepts one argument, an instance of the Person class 
    #   makes person calling happier by three points 
    #   makes the friend happier by three points 
    #   never makes the happiness of either pary exeed 10 (hint use the custom #happiness= method)
    #   calls on the #happiness= method to increment happiness 
    #   returns a string that reflects the caller's side of the conversation
    def call_friend(friend)
        self.happiness += 3 
        friend.happiness += 3 
         "Hi #{friend.name}! It's #{self.name}. How are you?"
  end

  # #start_conversation: accepts two arguments, a person to strick a convo with and a topic 
  # with topic: politics 
  #     return blah blah partisan blah lobbyist' if the topic is politics
  #     if topic is politics, it makes both people in the convo two points less happy
  #     never makes either party less than 0 points happy (never negative) (hint: use your #happiness= method)
  #      calls on the #happiness= method
  # with topic: weather 
  #      returns 'blah blah sun blah rain' if the topic is weather
  #      if topic is weather, it makes both people in the convo one point more happy 
  #     never makes either party more than 10 points happy (hint: use your #happiness= method)
  #      calls on the #happiness= method
  # with topic: other 
  #      returns 'blah blah blah blah blah' if the topic is not politics or weather 
  #      if topic is not politics or weather, it doesn't affect happiness
  def start_conversation(friend, topic)
    case topic
    when "politics"
        [self, friend].each {|person| person.happiness -= 2}
        "blah blah partisan blah lobbyist"
    when "weather"
        [self, friend].each {|person| person.happiness += 1}
        "blah blah sun blah rain"
    else 
         "blah blah blah blah blah"
    end
end

end

gary = Person.new("Gary")
puts gary.name
    #=> Gary 
# gary.name = "Coby"
# puts gary.name
# Gives you error:  undefined method `name=' for #<Person:0x00007fffe27dba60> (NoMethodError)
puts gary.bank_account 
    #=> 25 
puts gary.happiness 
    #=> 8 
puts gary.hygiene
    #=> 8
gary.happiness = 11
puts gary.happiness
    #=> 11 
gary.hygiene = -6
puts gary.hygiene
    #=> 0 
puts gary.happy?
#=> true 
puts gary.clean?
#=> false

puts gary.get_paid(100)
#=> all about the benjamins 
puts gary.bank_account
#=> 125

puts gary.take_bath
#=> ♪ Rub-a-dub just relaxing in the tub ♫
puts gary.hygiene
#=> 4 
puts gary.take_bath # adds 4, new total 8
#=> ♪ Rub-a-dub just relaxing in the tub ♫ 
puts gary.take_bath # adds 4 new total > 12, so it stops at 10 
#=> ♪ Rub-a-dub just relaxing in the tub ♫ 
puts gary.hygiene
#=> 10

puts gary.work_out
# => ♪ another one bites the dust ♫ 
puts gary.happiness
#=> 10 (b/c happiness was at 10 alread)
puts gary.hygiene
#=> 7

# make a new Person instance and set it as friend 
sally = Person.new("Sally")
puts gary.call_friend(sally)
#=> Hi Sally! It's Gary. How are you? 
puts gary.happiness
#=> 10
puts sally.happiness
#(8+3) => 10

puts gary.start_conversation(sally, "politics")
#=> blah blah partisan blah lobbyist
puts gary.happiness
# (10-3) => 8  
puts sally.happiness
# (10-3) => 8  

puts gary.start_conversation(sally, "weather")
#=> blah blah sun blah rain
puts gary.happiness
# (8+1) => 9
puts sally.happiness
#  (8+1) => 9

puts gary.start_conversation(sally, "other")
#=> blah blah blah blah blah
puts gary.happiness
#=> 9
puts sally.happiness
#=> 9



