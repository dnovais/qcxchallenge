module Questions
  class HotterQuestionsQuery < ApplicationQuery
    def initialize
      @relation = Question
    end

    def call
      query
    end

    private

    attr_reader :relation
    
    def query
      relation.joins("LEFT JOIN disciplines ON disciplines.id = questions.discipline_id")
              .group('disciplines.id')
              .select('disciplines.name as discipline, SUM(daily_access) as full_daily_access')
              .order(full_daily_access: :desc)
    end
  end
end