# discourse-user-bulk-action/

A simple ruby script for performing bulk actions (CREATE, UPDATE, ACTIVATE or INACTIVATE) on a list of [Discourse](https://github.com/discourse/discourse) users (defined in `users.yml`).

## To Use

### 1. Create `users.yml`:

```
wget -O ./script/users.yml https://raw.githubusercontent.com/jonmbake/discourse-user-bulk-action/master/users.yml
```

### 2. Edit `users.yml` with the list of users you want to perform a bulk operation on.

### 3. Run the Script within Rails Console:

```
./launcher enter app
wget -O ./script/user_bulk_action.rb https://raw.githubusercontent.com/jonmbake/discourse-user-bulk-action/master/user_bulk_action.rb
rails c
load 'script/user_bulk_action.rb'
```

### 4. Enter the Action That You Wish to Perform

First a blurb about what the script does will appear and you will then be prompted for the action that you wish to take:

```
This script will perform a bulk action on the following users: User1, User2.
Note: When performing an Update the values are matched on email.

Please enter the action you would like to perform: CREATE, UPDATE or INACTIVATE
```
