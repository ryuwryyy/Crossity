class TopController < ApplicationController
  def index
    @question = Question.new
    @questions = Question.all.includes(:participants)
    @participant = Participant.new
    @feed_contents = current_user.group.feed_contents.includes(:content).page(params[:page]).per(5)
    @feed_contents_resource = @feed_contents.map(&:content)
    @find = Participant.find_by(question_id:params[:id], user_id: params[current_user.id], number: "1")
  end
end
