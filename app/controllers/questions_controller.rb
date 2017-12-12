class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
	if params[:search]
      		@questions = Question.search(params[:search]).order("created_at DESC")
    	else
      		@questions = Question.all
    	end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
    @question.visits_count += 1
    @question.save
  end

  # GET /questions/new
  def new
    if current_user
	if Permit.find_by(name: "Crear pregunta").enabled?
		if current_user.permits.find_by(name: "Crear pregunta") == nil

			flash[:danger] = "No cuenta con los permisos para publicar."
			redirect_to "/"
		else
     			@question = Question.new   
		end
	else
		flash[:danger] = "No está permitida la creación de preguntas."

      		redirect_to "/"
	end
    else 
      flash[:danger] = "No cuenta con los permisos para publicar. REGISTRESE."

      redirect_to "/"

    end
  end
  def voteposi
    if current_user 
      if current_user.id =! @question.id
        user=@question.user
        user.puntaje+=1

        if user.save
          flash[:success] = "se voto correctamente"
         redirect_to @question
       else 
        flash[:danger] = "no se voto correctamente"
        redirect_to @question
      end
      end
    end
  end
  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
# Se debe preguntar si el usuario cuenta con permisos para realizar crear una pregunta.
    	@question = Question.new(question_params)
    	@question.titulo = params[:question][:titulo]
    	@question.descripcion = params[:question][:descripcion]
         	@question.user_id = current_user.id

	#ASIGNACIÓN DE FACULTAD POR DEFECTO. Cambiarla con la asignación real.


    	if @question.category_ids.size > 5
			flash[:danger] = "Elija 5 categorías como máximo."
			redirect_to "/questions/new"
		else
			if @question.category_ids.size == 0
				gen=Category.find_by(name:"General")
				@question.categories = [gen]
			end
			if @question.save
				flash[:success] = "La pregunta ha sido publicada con exito."
				redirect_to @question
			else 
				flash[:danger] = "Error al crear la pregunta...."
				redirect_to "/questions/new"
			end
		end
			
      #current_user.save  


 #deberia ser current_user o algo asi.


    	
      #current_user.save  
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    if current_user == @question.user
    @question.answers.destroy_all
    @question.destroy
    flash[:success] = "La pregunta ha sido eliminada."
    redirect_to "/questions"
  else

    flash[:danger] = " No se pudo eliminar la pregunta."
     redirect_to "/questions"
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
		params.require(:question).permit(:titulo, :descripcion, :faculty_id, {category_ids: []})
		#params.fetch(:question, {})
    end
end
