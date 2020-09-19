require 'json'
require 'ruby-progressbar'

question_access_file = File.read('db/questions_data/question_access.json')

question_accesses_json = JSON.parse(question_access_file)

puts "Importing question accesses..."
Parallel.each(question_accesses_json, in_processes: 8, progress: "Importing...") do |question_access_json|
  QuestionAccess.create(
    id: question_access_json['id'],
    question_id: question_access_json['question_id'],
    date: question_access_json['date'],
    times_accessed: question_access_json['times_accessed'],
    created_at: question_access_json['created_at'],
    updated_at: question_access_json['updated_at']
  )
end
puts "Question Accesses - finish!"