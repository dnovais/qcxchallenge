require 'rails_helper'

RSpec.describe Discipline, type: :model do
  context 'associations' do
    context 'has many questions' do
      it { should have_many(:questions) }
    end
  end
end
