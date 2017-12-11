class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
  if Permit.find_by(name: "Comentar").enabled?
  if current_user.permits.find_by(name: "Comentar") == nil
	flash[:danger] = "No tiene los permisos para comentar."
	redirect_to "/"
  else
    comment = Comment.new
    comment.texto = params[:cuerpo]
    comment.question_id = params[:question_id]
	comment.answer_id = params[:answer_id]
    
    comment.user_id = current_user.id
    if comment.save(validate: false)
      flash[:success] = "Se envio el mensaje correctamente."
	if comment.question == nil
		redirect_to comment.answer.question
	else
		redirect_to comment.question
	end
    else 
      flash[:danger] = "Hubo algun problema al enviar el mensaje."
        redirect_to "/"
    end
  end
  else
	flash[:danger] = "No está permitida la creación de comentarios."
	redirect_to "/"
 
  end
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


def delete
	if Comment.find(params[:comment_id]).user == current_user
		Comment.find(params[:comment_id]).destroy
		flash[:success] = "Se elimino el comentario correctamente"
		redirect_to "/questions"
	else
		flash[:error] = "No tiene permiso para eleminar este comentario"
		redirect_to "/questions"
	end
end
  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.fetch(:comment, {})
    end
end
