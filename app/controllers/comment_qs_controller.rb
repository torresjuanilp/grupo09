class CommentQsController < ApplicationController
  before_action :set_comment_q, only: [:show, :edit, :update, :destroy]

  # GET /comment_qs
  # GET /comment_qs.json
  def index
    @comment_qs = CommentQ.all
  end

  # GET /comment_qs/1
  # GET /comment_qs/1.json
  def show
  end

  # GET /comment_qs/new
  def new
    @comment_q = CommentQ.new
  end

  # GET /comment_qs/1/edit
  def edit
  end

  # POST /comment_qs
  # POST /comment_qs.json
  def create
    @comment_q = CommentQ.new(comment_q_params)

    respond_to do |format|
      if @comment_q.save
        format.html { redirect_to @comment_q, notice: 'Comment q was successfully created.' }
        format.json { render :show, status: :created, location: @comment_q }
      else
        format.html { render :new }
        format.json { render json: @comment_q.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_qs/1
  # PATCH/PUT /comment_qs/1.json
  def update
    respond_to do |format|
      if @comment_q.update(comment_q_params)
        format.html { redirect_to @comment_q, notice: 'Comment q was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment_q }
      else
        format.html { render :edit }
        format.json { render json: @comment_q.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_qs/1
  # DELETE /comment_qs/1.json
  def destroy
    @comment_q.destroy
    respond_to do |format|
      format.html { redirect_to comment_qs_url, notice: 'Comment q was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_q
      @comment_q = CommentQ.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_q_params
      params.fetch(:comment_q, {})
    end
end
