require 'json'
require 'ruby-progressbar'

puts "Opening File"
questions_file = File.read('db/questions_data/questions.json')

puts "Parsing JSON"
questions_json = JSON.parse(questions_file)
disciplines = questions_json.map{|question| question['discipline']}.uniq

puts "Creating disciplines"
disciplines.each do |discipline|
  Discipline.create(name: discipline)
end
puts "#{disciplines.count} disciplines created!\n"