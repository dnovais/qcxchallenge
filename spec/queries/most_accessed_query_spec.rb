require 'rails_helper'

RSpec.describe Questions::MostAccessedQuery do
  subject { described_class.call(period) }

  context 'when questions is empty' do
    let(:period) { 'week' }

    it 'returns an empty array' do
      expect(subject).to match_array([]) 
    end
  end

  context 'when questions is not empty' do
    let(:disciplines) do
      array = [
        "português", 
        "direito civil", 
        "legislação federal", 
        "direito constitucional", "literatura", "estatística", 
        "geografia", "inglês", "raciocínio lógico", "matemática"
      ]

      array.each do |discipline_name| 
        create(:discipline, name: discipline_name)
      end
    end

    context 'when period is week' do
      let(:period) { 'week' }

      let(:questions) do
        disciplines
        Discipline.all.each do |discipline|
          create_list(:question, 1, discipline: discipline)
        end
      end
  
      let(:questions_accesses) do
        questions
        Question.all.each do |question|
          create_list(:question_access, 10, :this_week, question: question)
        end
      end
  
      before do
        questions_accesses
      end

      it 'returns the questions with the most access this week' do
        expect(subject.length).to eq(10) 
      end
    end

    context 'when period is month' do
      let(:period) { 'month' }

      let(:questions) do
        disciplines
        Discipline.all.each do |discipline|
          create_list(:question, 2, discipline: discipline)
        end
      end
  
      let(:questions_accesses) do
        questions
        Question.all.each do |question|
          create_list(:question_access, 30, :this_month, question: question)
        end
      end
  
      before do
        questions_accesses
      end

      it 'returns the questions with the most access this month' do
        expect(subject.length).to eq(20) 
      end
    end

    context 'when period is year' do
      let(:period) { 'year' }

      let(:questions) do
        disciplines
        Discipline.all.each do |discipline|
          create_list(:question, 3, discipline: discipline)
        end
      end
  
      let(:questions_accesses) do
        questions
        Question.all.each do |question|
          create_list(:question_access, 60, :this_year, question: question)
        end
      end
  
      before do
        questions_accesses
      end

      it 'returns the questions with the most access this month' do
        expect(subject.length).to eq(30) 
      end
    end
  end

end