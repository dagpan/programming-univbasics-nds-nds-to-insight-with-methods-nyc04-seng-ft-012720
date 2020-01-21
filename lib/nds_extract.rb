$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'



directors_database
pp directors_database

# Find a way to accumulate the :worldwide_grosses and return that Integer
# using director_data as input
def gross_for_director(director_data)
  directors_database
  column = 0
  sum = 0
#  movie_count = directors_database[director_data][:movies].size.to_i
  while column < directors_database[director_data][:movies].length.to_i do
      gross = directors_database[director_data][:movies][column][:worldwide_gross]     
      sum = sum + gross
      column += 1
  end
  sum
end

# Write a method that, given an NDS creates a new Hash
# The return value should be like:
#
# { directorOne => allTheMoneyTheyMade, ... }
directors_database
def directors_totals(directors_database)
  result_hash = {}
  row = 0
  while row < directors_database.length do
      name = directors_database[row][:name]
      director_data = row
      result_hash[name] = gross_for_director(director_data)
      row += 1
  end
  result_hash
end
