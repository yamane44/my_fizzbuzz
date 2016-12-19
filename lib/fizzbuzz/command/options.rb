require 'optparse'

module Fizzbuzz
  class Command
    module Options

      def self.parse!(argv)

        options = {}

        sub_command_parsers = Hash.new do|k,v|
          raise ArgumentError,"'#{v}' is not fizzbuzz sub command."
        end

        sub_command_parsers = create_sub_command_parsers(options)
        command_parser = create_command_parser

        begin
        command_parser.order!(argv)

        options[:command]=argv.shift

        if %w(fizzbuzz).include?(options[:command])
           raise ArgumentError,"#{options[:command]} id not found." if argv.empty?
            options[:id] = Integer(argv.first)
        end
        rescue OptionParser::MissingArgument,OptionParser::InvalidOption,ArgumentError => e
           abort e.message
        end

        options

      end

      def self.help_sub_command(parser)
          puts parser.help
          exit
      end

      def self.create_command_parser
        OptionParser.new do |opt|
          sub_command_help = [
             {name: 'fizzbuzz',summary: '# Get fizzbuzz result from limit number'},
             {name: 'version',summary: '# version'}
           ]
          opt.separator "#{opt.program_name} Available Commands:"
           sub_command_help.each do |command|
               opt.separator [opt.summary_indent,command[:name].ljust(40),command[:summary]].join(' ')                                                        
           end
        end                                                                    
      end

      def self.create_sub_command_parsers(options)
         sub_command_parsers = Hash.new do |k,v|
          raise ArgumentError,"'#{v}' is not fizzbuzz sub command."
         end

         sub_command_parsers['fizzbuzz'] = OptionParser.new do |opt|
         end
         
         sub_command_parsers
      end

      private_class_method :create_sub_command_parsers,:create_command_parser,:help_sub_command
    end
  end
end
