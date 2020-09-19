require 'json'
require 'ruby-progressbar'

questions_file = File.read('db/questions_data/questions.json')

questions_json = JSON.parse(questions_file)

puts "Importing questions..."
Parallel.each(questions_json, :in_processes => 8, progress: "Importing...") do |question_json|
  discipline = Discipline.find_by(name: question_json['discipline'])

  question = Question.find_by(id: question_json['id'])

  if question.blank?
    Question.create do |question|
      question.id = question_json['id']
      question.discipline_id = discipline.id
      question.statement = question_json['statement']
      question.text = question_json['text']
      question.answer = question_json['answer']
      question.daily_access = question_json['daily_access']
      question.created_at = question_json['created_at']
      question.updated_at = question_json['updated_at']
    end
  end
end
puts "Questions - finish!\n"