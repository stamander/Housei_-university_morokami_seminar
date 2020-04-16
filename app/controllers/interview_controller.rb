class InterviewController < ApplicationController
  def index
    @interview = Interview.all
  end

  def new
    @interview = Interview.new
    @interviews = Interview.all
  end

  def show
    @interview = Interview.find(params[:id])
  end

  def create
    Interview.create(interview_parameter)
    redirect_to interview_index_path
  end

  def destroy
    @interview = Interview.find_by(id:params[:id])
    @interview.destroy
    redirect_to interview_path, notice:"削除しました"
  end

  def edit
    @interview= Interview.find(params[:id])
  end

  def update
    @interview = Interview.find(params[:id])
    if @interview.update(interview_parameter)
      redirect_to interview_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def interview_parameter
    params.require(:interview).permit(:name,:start_time)
  end

end
