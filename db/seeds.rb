# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
10.times do 
  User.create(
    rut: Faker::ChileRut.full_rut,
    name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    prescense: Faker::Boolean.boolean(true_ratio: 0.5),
    n_list: Faker::Number.between(from: 1, to: 10),
  )
end