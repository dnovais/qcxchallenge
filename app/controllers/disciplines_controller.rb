class DisciplinesController < ApplicationController
  def index
    @disciplines = Questions::HotterQuestionsQuery.call
  end
end
