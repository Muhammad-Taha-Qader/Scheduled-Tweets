# user model : this is a wrapper around your database so we can use this to query the database and see all of the users that we have but we can also look them up and create new ones and delete them and update them as well

# HAS:
# email: string
# password_digest: string (we will never set it ourself)
#         we will only use following and it will auto hash and store pass in password_digest field
# password: string virtual
# password_confirmation: string virtual
# rails will store as ("email", "password_digest", "created_at", "updated_at")

class User < ApplicationRecord
    has_secure_password # method Ufrom rails this is going to use that password digest feature or column in our database and it's going to add a password and a password confirmation to our user these are virtual attributes that won't get saved to the database but when you submit a password it will run through bcrypt and hash that password so it can be saved in the database but it can also be used to look the user up for authentication when they log
end
