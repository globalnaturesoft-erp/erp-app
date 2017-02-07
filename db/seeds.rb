# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Load other engines seed
Erp::Core::Engine.load_seed
Dir.glob(Rails.root.join('engines').to_s + "/*") do |d|
  eg = d.split(/[\/\\]/).last
  if eg != "core" and Erp::Core.available?(eg)
    "Erp::#{eg.camelize}::Engine".constantize.load_seed
  end
end