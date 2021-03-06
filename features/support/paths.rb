module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    when /create timesheet page/
      new_timesheet_path

    when /list timesheets page/
      timesheets_path

    when /^(.*)'s listing days page$/
      "/timesheets/#{Timesheet.find_by_owner($1).id}/days"

    when /new day on (.*)'s page/
      "/timesheets/#{Timesheet.find_by_owner($1).id}/days/new"

    when /^(.*)'s "(.*)" day page/
      "/timesheets/#{Timesheet.find_by_owner($1).id}/days/#{(Day.where(:arrival => "#{$2} 00:00".."#{$2} 23:59")).first.id}"

    when /^(.*)'s first day page/
      "/timesheets/#{Timesheet.find_by_owner($1).id}/days/1"

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
