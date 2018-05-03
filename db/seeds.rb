# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
  {name: 'sinclair'},
  {name: 'kenny'},
  {name: 'a user'},
  {name: 'another user'}
  ])

game = Game.create()

ug = Match.create([
  {user: users[0], game: game},
  {user: users[1], game: game},
  {user: users[2], game: game},
  {user: users[3], game: game}
  ])

score = Score.create({
  game: game,
  points: 10000000
  })
