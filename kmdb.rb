# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Movie.destroy_all
Actor.destroy_all
Studio.destroy_all
Character.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

#ANS: Completed through the terminal. I use the domain model I built for hw1

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

studio=Studio.new
studio["name"]="Warner Bros."
studio.save

warner=Studio.find_by({"name"=>"Warner Bros."})


movie=Movie.new
movie["title"]="Batman Begins"
movie["year"]="2005"
movie["MPAA_rating"]="PG-13"
movie["studio_id"]=warner["id"]
movie.save

batmanbegins=Movie.find_by({"title"=>"Batman Begins"})

movie=Movie.new
movie["title"]="The Dark Knight"
movie["year"]="2008"
movie["MPAA_rating"]="PG-13"
movie["studio_id"]=warner["id"]
movie.save

thedarkknight=Movie.find_by({"title"=>"The Dark Knight"})

movie=Movie.new
movie["title"]="The Dark Knight Rises"
movie["year"]="2012"
movie["MPAA_rating"]="PG-13"
movie["studio_id"]=warner["id"]
movie.save

thedarkknightrises=Movie.find_by({"title"=>"The Dark Knight Rises"})

actor=Actor.new
actor["name"]="Christian Bale"
actor.save

bale=Actor.find_by({"name"=>"Christian Bale"})

actor=Actor.new
actor["name"]="Michael Caine"
actor.save

caine=Actor.find_by({"name"=>"Michael Caine"})

actor=Actor.new
actor["name"]="Liam Neeson"
actor.save

neeson=Actor.find_by({"name"=>"Liam Neeson"})


actor=Actor.new
actor["name"]="Katie Holmes"
actor.save

holmes=Actor.find_by({"name"=>"Katie Holmes"})


actor=Actor.new
actor["name"]="Gary Oldman"
actor.save

oldman=Actor.find_by({"name"=>"Gary Oldman"})


actor=Actor.new
actor["name"]="Heath Ledger"
actor.save

ledger=Actor.find_by({"name"=>"Heath Ledger"})


actor=Actor.new
actor["name"]="Aaron Eckhart"
actor.save

eckhart=Actor.find_by({"name"=>"Aaron Eckhart"})


actor=Actor.new
actor["name"]="Maggie Gyllenhaal"
actor.save

gyllenhaal=Actor.find_by({"name"=>"Maggie Gyllenhaal"})


actor=Actor.new
actor["name"]="Tom Hardy"
actor.save

hardy=Actor.find_by({"name"=>"Tom Hardy"})


actor=Actor.new
actor["name"]="Joseph Gorden-Levitt"
actor.save

joseph=Actor.find_by({"name"=>"Joseph Gorden-Levitt"})


actor=Actor.new
actor["name"]="Anne Hathaway"
actor.save

hathaway=Actor.find_by({"name"=>"Anne Hathaway"})


character=Character.new
character["name"]="Bruce Wayne"
character["movie_id"]=batmanbegins["id"]
character["actor_id"]=bale["id"]
character.save


character=Character.new
character["name"]="Alfred"
character["movie_id"]=batmanbegins["id"]
character["actor_id"]=caine["id"]
character.save

character=Character.new
character["name"]="Ra's Al Ghul"
character["movie_id"]=batmanbegins["id"]
character["actor_id"]=neeson["id"]
character.save

character=Character.new
character["name"]="Rachel Dawes"
character["movie_id"]=batmanbegins["id"]
character["actor_id"]=holmes["id"]
character.save

character=Character.new
character["name"]="Commissioner Gordon"
character["movie_id"]=batmanbegins["id"]
character["actor_id"]=oldman["id"]
character.save

character=Character.new
character["name"]="Bruce Wayne"
character["movie_id"]=thedarkknight["id"]
character["actor_id"]=bale["id"]
character.save

character=Character.new
character["name"]="Joker"
character["movie_id"]=thedarkknight["id"]
character["actor_id"]=ledger["id"]
character.save

character=Character.new
character["name"]="Harvey Dent"
character["movie_id"]=thedarkknight["id"]
character["actor_id"]=eckhart["id"]
character.save

character=Character.new
character["name"]="Alfred"
character["movie_id"]=thedarkknight["id"]
character["actor_id"]=caine["id"]
character.save

character=Character.new
character["name"]="Rachel Dawes"
character["movie_id"]=thedarkknight["id"]
character["actor_id"]=gyllenhaal["id"]
character.save

character=Character.new
character["name"]="Bruce Wayne"
character["movie_id"]=thedarkknightrises["id"]
character["actor_id"]=bale["id"]
character.save

character=Character.new
character["name"]="Commissioner Gordon"
character["movie_id"]=thedarkknightrises["id"]
character["actor_id"]=oldman["id"]
character.save

character=Character.new
character["name"]="Bane"
character["movie_id"]=thedarkknightrises["id"]
character["actor_id"]=hardy["id"]
character.save

character=Character.new
character["name"]="John Blake"
character["movie_id"]=thedarkknightrises["id"]
character["actor_id"]=joseph["id"]
character.save

character=Character.new
character["name"]="Selina Kyle"
character["movie_id"]=thedarkknightrises["id"]
character["actor_id"]=hathaway["id"]
character.save



# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
movies=Movie.all

for movie in movies
    name=movie["title"]
    year=movie["year"]
    rate=movie["MPAA_rating"]
    studio_film=Studio.find_by({"id"=>movie["studio_id"]})
    studio_name=studio_film["name"]
    puts "#{name} #{year} #{rate} #{studio_name}"
end



# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
characters=Character.all
for character in characters
    film_search=Movie.find_by({"id"=>character["movie_id"]})
    film_name=film_search["title"]
    actor_search=Actor.find_by({"id"=>character["actor_id"]})
    actor_name=actor_search["name"]
    character_name=character["name"]
    puts "#{film_name} #{actor_name} #{character_name}"
end

