class FeedbackController < ApplicationController

  def download
   
    @exercise = Exercise.find(params[:format])
    b = @exercise.mcqs.all
    

    
    pdf = Prawn::Document.new 
    b.each do |a|
      pdf.text a.quesname,style: :bold
      pdf.text a.option1
      pdf.text a.option2
      pdf.text a.option3
      pdf.text a.option4
      pdf.text a.answer ,style: :bold
    end
  
  


    send_data(pdf.render,
      filename: "feedback.pdf",
    type: "application/pdf")
  end

  
 
  def index
    @feedback = Feedback.all
  end

  def create
    @feedback = Feedback.new
    @feedback.user_id = current_user.id 
    @feedback.exercise_id = params[:exercise_id]
    @feedback.point = cal_points(params)
        
        if @feedback.save 
          redirect_to feedback_path(@feedback)
        else 
          redirect_to root_path
        end

  end

  def show
    @feedback = Feedback.find(params[:id])
    @exercise = Exercise.find(@feedback.exercise_id)

  end
  private
  def feedback_params 
    params.require(:feedback).permit(:user_id,:exercise_id,:point,:feedback_id,:format)

  end

  def cal_points(params) 
    @score = 0
    @ans = []
    @exe = params[:exercise_id].to_i
    @exercise = Exercise.find(@exe)
    @len = @exercise.mcqs.count
    
    @fmcqid = @exercise.mcqs.first.id
    @lmcqid = @exercise.mcqs.last.id
    
    @exercise.mcqs.each do |a|
      @ans << a.answer
    end
    
    @a = []
    while @fmcqid < @lmcqid + 1 do
      
      @a << params["#{@fmcqid}"]
      @fmcqid += 1
      
    end
      
    while @len > 0  do 
      if @ans[@len] == @a[@len]
        @score += 1

      end
      @len = @len - 1
      

    end
   

  return @score 
  end

  


end
