require "ostruct"


#
# Create Admin User
#


User.create!(
  first_name:            "Admin",
  last_name:             "User",
  email:                 "admin@test.test",
  password:              "password",
  password_confirmation: "password",
  type:                  "AdminUser"
)


#
# Create Sample Users
#


users = [
  OpenStruct.new(first_name: "Sandi", last_name: "Metz"),
  OpenStruct.new(first_name: "Yukihiro", last_name: "Matsumoto"),
  OpenStruct.new(first_name: "Avdi", last_name: "Grimm"),
  OpenStruct.new(first_name: "Jim", last_name: "Weirich")
]

users.each do |user|
  puts "Creating user '#{user.first_name} #{user.last_name}'..."

  User.create!(
    first_name:            user.first_name,
    last_name:             user.last_name,
    email:                 "#{user.first_name}.#{user.last_name}@test.test",
    password:              "password",
    password_confirmation: "password"
  )
end


#
# Create Sample Posts
#


99.times do |post_number|
  puts "Creating post #{post_number}..."

  Post.create!(
    user:      User.all.where(type: nil).sample,
    date:      Time.zone.now,
    rationale: "Post #{post_number} rationale content."
  )
end


#
# Print Warning
#


puts
puts "--------------------------------------------------------"
puts "IMPORTANT!: Remember to modify admin data in production."
puts "--------------------------------------------------------"
puts
