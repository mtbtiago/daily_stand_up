namespace :custom do
  # run this task with a cron, every hour
  # It will:
  # create a new day, if not created
  # send asking mails
  # send recap mail

  desc "Daily Standup cron task Call: rake 'custom:process[team_id]' If not team_id, all teams are processed"
  task :process, [:team_id] => [:environment] do |_task, args|
    class DailyProcess
      def initialize(team_id = nil)
        # TODO: multi team when team.nil?
        team = (team_id.nil? ? Team.first : Team.find(team_id))
        @day = Day.find_by(today: Time.zone.today) || create_day(team)
      end

      def execute
        puts "Processing #{@day.today.to_date} for team #{@day.team.name}"
        if @day.response_sent
          puts "Today's response sent yet"
        elsif Time.zone.now >= @day.standup_end
          send_responses
        elsif @day.question_sent
          puts 'Waiting for responses'
        elsif Time.zone.now >= @day.standup_start
          send_questions
        else
          puts 'Never should go here!'
        end
      end

      private

      def send_questions
        puts 'Sending questions'
        @day.responses.each { |response| puts "Sending questions to #{response.user.name} at #{response.user.email}" }
        @day.update_attributes(question_sent: Time.zone.now)
      end

      def send_responses
        puts 'Sending responses'
        @day.responses.each { |response| puts "Sending responses to #{response.user.name} at #{response.user.email}" }
        @day.update_attributes(response_sent: Time.zone.now)
      end

      def create_day(team)
        team.days.create.tap do |day|
          team.team_users.select(&:active).each { |tu| Response.create!(team: team, day: day, user: tu.user) }
        end
      end
    end

    # main
    DailyProcess.new(args[:team_id]&.to_i).execute
  end
end
