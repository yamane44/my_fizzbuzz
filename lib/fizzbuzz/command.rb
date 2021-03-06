
module Fizzbuzz
  class Command

     def self.run(argv)
       new(argv).execute
     end

     def initialize(argv)
       @argv = argv
     end

     def execute
       options = Options.parse!(@argv)
       sub_command = options.delete(:command)

       case sub_command
            when 'fizzbuzz'
              fizzbuzz(options[:id])
            when 'version'
              version
            end
     rescue => e
       abort "Error: #{e.message}"
     end

     def fizzbuzz(limit) 
       limit_number = Integer(limit)
       (0..limit_number).map do |num|
         if (num % 15).zero? then print 'FizzBuzz'
         elsif (num % 5).zero? then print 'Buzz'
         elsif (num % 3).zero? then print 'Fizz'
         else print num.to_s
         end
         print ' '
       end
     end

     def version
       puts Fizzbuzz::VERSION
       exit
     end

     private

     def full_width_count(string)
       string.each_char.select{|char| !(/[ -~｡-ﾟ]/.match(char))}.count
     end
  end
end
