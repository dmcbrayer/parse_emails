require 'json'
require 'csv'

#read JSON from a file
file = File.open("_User.json")
json = file.read

#parse that JSON with the official JSON parser
parsed = JSON.parse(json)


#for everything in "results", put the content of each "user" field into an array
CSV.open('emails.csv', 'w') do |csv|
  parsed["results"].each do |user|
    csv << [user["email"]]
  end
end