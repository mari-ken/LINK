# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  [
    {
      email: 'a@a',
      name: 'テストA',
      password: 'testes'
    },
    {
      email: 'b@b',
      name: 'テストB',
      password: 'testes'
    },
    {
      email: 'c@c',
      name: 'テストC',
      password: 'testes'
    },
    {
      email: 'd@d',
      name: 'テストD',
      password: 'testes'
    }
  ]
)