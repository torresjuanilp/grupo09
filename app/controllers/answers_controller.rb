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
	@answer = Answer.find(params[:id])
  end


  # GET /answers/1/edit
  def edit
  end

  # POST /answers
def elegirmejor
if (Question.find(params[:question_id]).user == current_user )
  if Question.find(params[:question_id]).tiene_mejor_resp == false
    answer = Answer.find(params[:answer_id])
    answer.mejor_resp = true
    q=Question.find(params[:question_id])
    q.tiene_mejor_resp = true
    usuario = answer.user

    if usuario.id != q.user.id
      usuario.puntaje += 20
      usuario.save
    end
     if (answer.save && q.save)
       flash[:success] = "Se elegió la mejor respuesta."
        redirect_to answer.question
      else
      flash[:error] = "No se pudo elegir mejor respuesta"  
      redirect_to answer.question
        end
  else 
       flash[:error] = "YA hay una mejor respuesta"
        redirect_to "/questions"
  end
else
  flash[:error] = "No posee los permisos necesarios para elegir la mejor respuesta"
  redirect_to "/questions"
end
end
  # POST /answers.json
  def new
	if current_user.permits.find_by(name: "Crear pregunta") == nil
		flash[:danger] = "No tiene los permisos para crear una respuesta."
		redirect_to "/"
	else
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
     a=Answer.find(params[:answer_id])
     if (a.mejor_resp == true)
      a.question.tiene_mejor_resp = false
      a.question.save
      a.mejor_resp = false
   end
    a.destroy
    flash[:success] = "Se elimino la respuesta correctamente"
    redirect_back( fallback_location: (request.referer || root_path))
  else

    flash[:error] = "No tiene permiso para eleminar este comentario"

     redirect_back( fallback_location: (request.referer || root_path))
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
