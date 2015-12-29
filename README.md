# discourse-user-bulk-action/

A simple ruby script for performing bulk actions (CREATE, UPDATE, ACTIVATE or INACTIVATE) on a list of users defined in `users.yml`.

## To Use

Edit `users.yml` with the list of users you want to perform a bulk operation on.

Then enter the following sequence of commands:

```
./launcher enter app
wget https://github.com/jonmbake/discourse-user-bulk-action/archive/master.zip && unzip master.zip -d script && rm master.zip
rails c
load 'script/discourse-user-bulk-action/user_bulk_action.rb'
```

Then a blurb about what the script does will appear and you will then be prompted for the action that you wish to take:

```
This script will perform a bulk action on the following users: User1, User2.
Note: When performing an Update the values are matched on email.

Please enter the action you would like to perform: CREATE, UPDATE or INACTIVATE
```
