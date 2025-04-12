# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Cleaning database...'
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

puts 'Creating movies...'
movies = [
  { title: 'The Shawshank Redemption', overview: 'Two imprisoned men bond over a number of years.', poster_url: 'https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg' },
  { title: 'The Godfather', overview: 'The aging patriarch of an organized crime dynasty transfers control to his reluctant son.', poster_url: 'https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg' },
  { title: 'The Dark Knight', overview: 'Batman raises the stakes in his war on crime.', poster_url: 'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg' },
  { title: 'Pulp Fiction', overview: 'The lives of two mob hitmen, a boxer, and a gangster intertwine.', poster_url: 'https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg' },
  { title: 'Inception', overview: 'A thief who steals corporate secrets through dream-sharing technology.', poster_url: 'https://image.tmdb.org/t/p/w500/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg' }
]

movies.each do |movie_data|
  Movie.create!(movie_data)
end

puts 'Creating lists...'
lists = [
  { name: 'Drama Collection', image_url: 'https://source.unsplash.com/random/300x200?drama' },
  { name: 'Action Thrillers', image_url: 'https://source.unsplash.com/random/300x200?action' },
  { name: 'Classic Favorites', image_url: 'https://source.unsplash.com/random/300x200?classic' }
]

lists.each do |list_data|
  List.create!(list_data)
end

puts 'Creating bookmarks...'
List.all.each do |list|
  2.times do
    Bookmark.create!(
      list: list,
      movie: Movie.all.sample,
      comment: 'Great movie!'
    )
  end
end

puts 'Finished seeding! 🎉'
