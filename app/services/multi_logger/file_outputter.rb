module MultiLogger
  class FileOutputter < Logger
    attr_reader :status, :error_msg, :application_path

    DEFAULT_PATH = 'tmp/file_log'

    def initialize(_filename, dir = nil)

      if _filename.class != String
        push_error "Argument 'filename' must be a String"
      end

      dir = dir || DEFAULT_PATH

      # file validation
      @application_path = Rails.root.join(dir)

      @file_name = Rails.root.join(@application_path, _filename)
      if FileTest.exist?( _filename )
        if not FileTest.file?( _filename )
          push_error "'#{_filename}' is not a regular file"
        elsif not FileTest.writable?( _filename )
          push_error "'#{_filename}' is not writable!"
        end
      else
        if not FileTest.writable?( @file_name )
          push_error "'#{@file_name}' is not writable!"
        end
      end
      @status = true if status.nil?
      init_file
      super(@file_name)
    end

    def push_error(msg)
      @status = false
      @error_msg ||= []
      @error_msg << msg
    end

    def init_file
      FileUtils.mkdir(application_path) unless Dir.exist?(application_path)
      File.new(@file_name)
      clean_error
    end

    def clean_error
      @status = true
      @error_msg = []
    end
  end
end