require 'rails_helper'

RSpec.describe Questions::HotterQuestionsQuery do
  subject { described_class.call }

  context 'when questions is empty' do
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

    let(:questions) do
      disciplines
      Discipline.all.each do |discipline|
        create_list(:question, 5, discipline: discipline)
      end
    end

    before do
      questions
    end

    it 'returns one record for each discipline' do
      expect(subject.length).to eq(disciplines.count) 
    end
  end
end