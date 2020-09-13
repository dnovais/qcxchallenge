require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'associations' do
    context 'belongs to discipline' do
      it { should belong_to(:discipline) }
    end

    context 'has many question accesses' do
      it { should have_many(:question_accesses) }
    end
  end
end
