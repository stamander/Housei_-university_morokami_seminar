class InterviewController < ApplicationController
  def index
    @interview = Interview.all
  end

  def new
    @interview = Interview.new
  end

  def show
    @interview = Interview.find(params[:id])
  end

  def create
    Interview.create(interview_parameter)
    redirect_to interview_path
  end

  def destroy
    @interview = Interview.find(params[:id])
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
    params.require(:interview).permit(:title, :content, :start_time)
  end

end
