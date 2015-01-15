require 'json'
require 'csv'

#Open _User.json and run it through the JSON parser
#and save the results as an array
parsed = JSON.parse(File.open("_User.json").read)

#Open a new CSV file, iterate through the "results" key, and put
#the contents of each user's "email" attribute into a csv row.
CSV.open('emails.csv', 'w') do |csv|
  parsed["results"].each do |user|
    csv << [user["email"]]
  end
end