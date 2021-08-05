emails = ["himama1@ex.com", "himama2@ex.com", "himama3@ex.com", "himama4@ex.com", "himama5@ex.com"]
emails.each do |email|
    if !User.find_by_email(email)
        User.create(password:"Himama@123" , first_name: "Kathy#{[*0..9].shuffle.sample(2).join}", last_name: "Davis#{[*0..9].shuffle.sample(2).join}", email: email, role_id: 2)
    end
end

["Admin", "Teacher"].each do |role|
    Role.create(name: role)
end
