# db/seeds.rb

male_names = %w[James John Robert Michael William Peter Fernando]
male_last_names = %w[Andrade Silva Rodrigues Miller Hernandes Walker]
female_names = %w[Mary Patricia Jennifer Linda Elizabeth Luiza Jane Luana]
female_last_names = %w[Andrade Silva Rodrigues Miller Hernandes Walker Watson]

departments = Employee.departments.keys
roles = Employee.roles.keys

# Create male employees
1.upto(7) do |i|
  Employee.create!(
    first_name: male_names.sample,
    last_name: male_last_names.sample,
    department: departments.sample,
    role: roles.sample,
    status: :active,
    email: Faker::Internet.email,
    photo: File.open(Rails.root.join("app/assets/images/male#{i}.jpg"))
  )
end

# Create female employees
1.upto(8) do |i|
  Employee.create!(
    first_name: female_names.sample,
    last_name: female_last_names.sample,
    department: departments.sample,
    role: roles.sample,
    status: :active,
    email: Faker::Internet.email,
    photo: File.open(Rails.root.join("app/assets/images/female#{i}.jpg"))
  )
end
