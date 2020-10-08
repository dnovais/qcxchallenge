class QuestionsController < ApplicationController
  def index
    @questions = Questions::MostAccessedQuery.call(params[:period])
    @questions = @questions.paginate(:page => params[:page], :per_page => 10)
  end
end
