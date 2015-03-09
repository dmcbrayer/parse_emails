require 'json'
require 'csv'
require 'date'

#Open _User.json and run it through the JSON parser
#and save the results as an array
parsed = JSON.parse(File.open("_User.json").read)

#Open a new CSV file, iterate through the "results" key, and put
#the contents of each user's "email" attribute into a csv row.
CSV.open('emails.csv', 'w') do |csv|
  parsed["results"].each do |user|
  	created_date = user["createdAt"][0...-14]
  	if created_date > '2015-03-01'
    	csv << [user["email"], created_date]
    end
  end
end