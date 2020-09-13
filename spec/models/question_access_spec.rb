require 'rails_helper'

RSpec.describe QuestionAccess, type: :model do
  context 'associations' do
    context 'belongs to question' do
      it { should belong_to(:question) }
    end
  end
end
