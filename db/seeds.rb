# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

movie = Movie.new(title: "Garaxy Quest", director: "Dean Parisot", year: 1999, plot: "The cast of an old 1980s space-adventure television series, Galaxy Quest, spend most of their days attending fan conventions and making promotional appearances. Though the series' conceited former star, Jason Nesmith, thrives on the attention, the other cast members—Gwen, Alexander, Fred, and Tommy—resent him and, to varying degrees, the states of their careers.", image: "https://upload.wikimedia.org/wikipedia/en/1/1f/Galaxy_Quest_poster.jpg")
movie.save

movie = Movie.new(title: "Tremors", director: "Ron Underwood", year: 1990, plot: "Valentine \"Val\" McKee and Earl Bassett are handymen working in Perfection, Nevada, an isolated settlement in the high desert east of the Sierra Nevada mountains. They eventually get tired of their jobs and leave for Bixby, the nearest town. As they leave, they discover the dead body of Edgar Deems, a fellow resident, perched atop an electrical tower, still grasping the tower's crossbeams and his rifle. Jim Wallace, the town's doctor, determines that Edgar died of dehydration, apparently having been too afraid to climb down.", image: "https://upload.wikimedia.org/wikipedia/en/f/f1/Tremors_official_theatrical_poster.jpg")
movie.save
