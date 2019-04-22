# require 'net/smtp'
# require 'time'
# module LoggerCustom
#   class EmailOutputter < Base
#     attr_accessor :address, :domain, :from, :subject, :to, :port
#     attr_accessor :user_name, :password, :enable_starttls_auto

#     def initialize(_name, hash={})
#       # super(_name, hash)
#       validate(hash)
#       @buff = []
#       begin
#         Logger.log_internal {
#           "EmailOutputter '#{@name}' running SMTP client on #{@server}:#{@port}"
#         }
#             rescue Exception => e
#         Logger.log_internal(-2) {
#           "EmailOutputter '#{@name}' failed to start SMTP client!"
#         }
#         Logger.log_internal {e}
#         self.level = OFF
#       end
#     end
#   end
# end
