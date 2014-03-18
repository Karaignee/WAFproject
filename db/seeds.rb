# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "=set up user groups or everything will break="
puts
if !Rails.env.test?

  print "01 UserGroup..."
  UserGroup.delete_all
  UserGroup.create!(id: 1, name: "Admin", description: "Can do anything on the system",
                    is_an_admin: true, is_a_member: true)
  UserGroup.create!(id: 2, name: "Charity", description: "Charity or NGO, regular access and can create projects",
                    is_an_admin: false, is_a_member: true)
  UserGroup.create!(id: 2, name: "Volunteer", description: "Volunteer with regular access",
                    is_an_admin: false, is_a_member: true)
  puts "ok"

  puts; puts "--- end ---"

end

