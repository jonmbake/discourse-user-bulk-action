# discourse-user-bulk-action

A simple ruby script for performing bulk actions (CREATE, UPDATE, ACTIVATE or INACTIVATE) on a list of [Discourse](https://github.com/discourse/discourse) users (defined in `users.yml`).

*Note:* UPDATE currently only updates username and/or name.  User Groups can also be specified (see example user.yml).  Groups will only be added via the script-- never removed.

## To Use

### 1. Enter into App

```
./launcher enter app
```

### 2. Create `users.yml`
This command will clone the example `user.yml`:

```
wget -O ./script/users.yml https://raw.githubusercontent.com/jonmbake/discourse-user-bulk-action/master/users.yml
```

### 3. Edit `users.yml` with the list of users you want to perform a bulk operation on.

### 4. Run the Script within Rails Console:

```
wget -O ./script/user_bulk_action.rb https://raw.githubusercontent.com/jonmbake/discourse-user-bulk-action/master/user_bulk_action.rb
rails c
load 'script/user_bulk_action.rb'
```

### 5. Enter the Action That You Wish to Perform

First a blurb about what the script does will appear and you will then be prompted for the action that you wish to take:

```
This script will perform a bulk action on the following users: User1, User2.
Note: When performing an Update the values are matched on email.

Please enter the action you would like to perform: CREATE, UPDATE, ACTIVATE or INACTIVATE.
```
