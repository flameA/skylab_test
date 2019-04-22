#config output for resource
# require 'app/services/multi_logger/file_outputter.rb'

std_out = Logger.new(STDOUT)
MasterLogger = MultiLogger::Base.new(loggers: std_out, level: 'INFO')

file_output = MultiLogger::FileOutputter.new('log_file.log')
MasterLogger.add_logger file_output
