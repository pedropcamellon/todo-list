# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing records
if (User.count > 0) 
    User.destroy_all
end

if (Project.count > 0)
    Project.destroy_all
end

if (Task.count > 0)
    Task.destroy_all
end

User.create(email: "Qy9sddsaoT@example.com", password: "password", password_confirmation: "password")

Project.create!(title: "Project 1", description: "Project 1 description", user_id: User.first.id)

5.times do |i|
  Task.create!(content: "Task #{i + 1} Content", project_id: Project.first.id, user_id: Project.first.user_id)
end