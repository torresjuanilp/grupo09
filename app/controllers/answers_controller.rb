class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end


  # GET /answers/1/edit
  def edit
  end

  # POST /answers

  # POST /answers.json
  def new
    answer = Answer.new
    answer.texto = params[:texto]
    answer.question_id = params[:question_id]
    answer.titulo= "Sin titulo"
    answer.user_id =current_user.id
  if answer.save
    flash[:success] = "Se envio el mensaje correctamente."
        redirect_to answer.question
    else 
      flash[:danger] = "Hubo algun problema al enviar el mensaje."
        redirect_to "/"
end
end  

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def delete
  if Answer.find(params[:answer_id]).user == current_user
    Answer.find(params[:answer_id]).destroy
    flash[:success] = "Se elimino el comentario correctamente"
    redirect_to "/questions"
  else
    flash[:danger] = "No tiene permiso para eleminar este comentario"
    redirect_to "/questions"
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.fetch(:answer, {})
    end
end
