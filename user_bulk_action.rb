require 'yaml'
users = YAML.load_file("#{File.expand_path(File.dirname(__FILE__))}/users.yml")
names = users.map {|u| u['username'] }.join(', ')

puts "This script will perform a bulk action on the following users: #{names}.\nNote: An UPSERT will create a user if an account for the email address doesn't exist, otherwise it will update the user record if it exists.\n\nPlease enter the action that you would like to perform: UPSERT, ACTIVATE or INACTIVATE"
action = $stdin.gets.chomp

users.each do |u|
  user = User.find_by_email(u['email'])
  case action
  when 'UPSERT'
    if user.nil?
      user = User.create!(u.except('groups'))
      user.activate
    else
      user.update(u.except('groups'))
    end
    u['groups'].try(:each) do |group_name|
      group = Group.find_by(name: group_name)
      user.groups << group unless group.nil? or user.groups.include?(group)
    end
  when 'ACTIVATE'
    user.try(&:activate)
  when 'INACTIVATE'
    user.try(&:deactivate)
  else
    abort('Unrecognized action.  Must be either UPSERT, ACTIVATE or INACTIVATE')
  end
end
