require 'yaml'
users = YAML.load_file("#{File.expand_path(File.dirname(__FILE__))}/users.yml")
names = users.map {|u| u['username'] }.join(',')

puts "This script will perform a bulk action on the following users: #{names}.\nNote: When performing an UPDATE the values are matched on **email**.\n\nPlease enter the action that you would like to perform: CREATE, UPDATE, ACTIVATE or INACTIVATE"
action = $stdin.gets.chomp

case action
when 'CREATE'
  users.each do |u|
    u = User.create!(u)
    u.activate
  end
when 'UPDATE'
  users.each do |u|
    u = User.find_by_email(u['email']).try { |u| u.update(u) }
  end
when 'ACTIVATE'
  users.each(&:activate)
  end
when 'INACTIVATE'
  users.each(&:deactivate)
else
  abort('Unrecognized action.  Must be either CREATE, UPDATE, ACTIVATE or INACTIVATE')
end
