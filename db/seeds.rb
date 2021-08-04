# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

emails = ["himama1@ex.com", "himama2@ex.com", "himama3@ex.com", "himama4@ex.com", "himama5@ex.com"]

emails.each do |email|
    if !User.find_by_email(email)
        User.create(first_name: "Kathy#{[*0..9].shuffle.sample(2).join}", last_name: "Davis#{[*0..9].shuffle.sample(2).join}", email: email, role_id: 2)
    end
end

#Himama@123
