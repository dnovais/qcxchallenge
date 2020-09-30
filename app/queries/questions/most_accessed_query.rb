module Questions
  class MostAccessedQuery < ApplicationQuery
    def initialize(period = 'week')
      @relation = Question
      @period = period
    end

    def call
      query
    end

    private

    attr_reader :relation, :period
    
    def query
      relation.joins("LEFT JOIN question_accesses ON question_accesses.question_id = questions.id")
              .group('questions.id')
              .select('questions.*, SUM(daily_access) as full_daily_access')
              .where('question_accesses.date BETWEEN ? AND ?', set_period.beginning_of_day, DateTime.now.end_of_day)
              .order(full_daily_access: :desc)
    end

    def set_period
      case period
      when 'month'
        DateTime.now.beginning_of_month
      when 'year'
        DateTime.now.beginning_of_year
      else
        DateTime.now.beginning_of_week
      end
    end
  end
end