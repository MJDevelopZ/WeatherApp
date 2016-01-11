#require gem
require 'rubygems'
require 'yahoo_weatherman'

#pass variable as argument to method to determine weather conditions
def get_location(user_location)
	client=Weatherman::Client.new
	client.lookup_by_location(user_location)
end

#use get to accept a location and assign that location to a variable
puts "Where are you? Please enter city or zip code. "
user_location=gets.chomp

#show condition
weather = get_location(user_location)

#Find Yahoo_Weatherman method to help figure out forecast, for the next 5 days.
	#client = Weatherman::Client.new
	#find_method = client.lookup_by_location(user_location)
	#puts find_method.methods
#Method needed is forecasts 
#puts weather.forecasts

#Write a loop that loops through all the data and translates each bit into a coherent sentence in the form of a string

#weather.forecasts.each do |forecasts|
	#puts forecasts['day'].to_s + " is going to be " + forecasts['text'].to_s + " with a low of " + forecasts['low'].to_s + " and a high of " + forecasts['high'].to_s + "."
#end

#Change forecast to read today and tomorrow rather than a weekday name.
today = Time.now.strftime("%w").to_i #result will be a string so must convert to an integer
#puts today


weather.forecasts.each do |forecasts|
	day = forecasts['date'] #create variable to hold the date
	weekday = day.strftime('%w').to_i 
	#Create if/else statment to compare if today is equal to the day of the week it is currtly, and also compare tomorrow's day. If it is none of the above then you will just want to show the name of the weekday. 
	if weekday == today
		dayName = 'Today'
	elsif weekday == today + 1 #can do this because today is an integer
		dayName = 'Tomorrow'
	else
		dayName = day.strftime('%A')#Displays the full weekday name
	end

puts dayName + " is going to be " + forecasts['text'].to_s.downcase + " with a low of " + forecasts['low'].to_s + " and a high of " + forecasts['high'].to_s + "."
end 