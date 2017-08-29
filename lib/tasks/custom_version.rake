namespace :custom do
  # This rake task shows and manages app version
  # rake task for managing app version.
  # Show current version or create new build, depending of parameters:
  # yyyymmdd.release.build
  # Release starts from zero every day
  # Build maintain numbering
  #
  # Rake task:
  #
  # * if current date exists, increment release, else set new date to today and release to zero.
  # * increment build always
  #
  # usage:
  # rake custom:version      # just show current version
  # rake custom:version[+]   # increment build
  # rake custom:version[123] # sets build to 123

  VERSION_FILE = 'app/helpers/application_helper.rb'.freeze

  desc "Show or changes #{VERSION_FILE} version values: rake custom:version[+] increments build"
  task :version, [:build] => [:environment] do |_task, args|
    class AppVersion
      def initialize(file_name, build)
        @in_file = file_name
        @read_only = build.nil?
        @build = build unless @read_only
      end

      def execute
        @tmp_file = Tempfile.new('increment_build')
        begin
          File.open(@in_file, 'r') do |file|
            file.each_line do |line|
              process line
            end
          end
          @tmp_file.close
          FileUtils.mv(@tmp_file.path, @in_file) unless @read_only
        ensure
          @tmp_file.close
          @tmp_file.unlink
        end
      end

      private

      def process(line)
        if line =~ /VERSION/
          if @read_only
            puts "Current: #{line}"
          else
            puts "Before: #{line}"
            incremented = process_version line
            @tmp_file.puts(incremented)
            puts "After : #{incremented}"
          end
        else
          @tmp_file.puts line
        end
      end

      def process_version(line)
        # line = VERSION = '20161016.0.373'.freeze
        strip_version = line.split("'")
        # strip_version = ["VERSION = ", "20161016.0.373", ".freeze"]
        version = strip_version[1]
        parts = version.split('.').map(&:to_i)
        # parts = [20161016, 0, 373]
        today_version = Time.zone.today.strftime('%Y%0m%0d').to_i
        if today_version == parts[0]
          parts[1] += 1
        else
          parts[0] = today_version
          parts[1] = 0
        end
        parts[2] = if @build == '+'
                     parts[2] + 1
                   else
                     @build
                   end
        strip_version[0] + "'" + parts.map(&:to_s).join('.') + "'" + strip_version[2]
      end
    end

    # main
    AppVersion.new(VERSION_FILE, args[:build]).execute
  end
end
