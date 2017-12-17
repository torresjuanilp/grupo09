class QuestionVotesController < ApplicationController

  def new
	
  end

  def create
	if params[:positive] == true 
		if Permit.find_by(name: "Votar positivo").enabled?
			if current_user.permits.find_by(name: "Votar positivo") == nil
				flash[:danger] = "No tiene los permisos necesarios para votar."
				redirect_to questions_path
			else


	@question_vote = QuestionVote.new	
	@question_vote.user_id = current_user.id
	@question_vote.positive = params[:positive]
	@question_vote.question_id = params[:question_id]
	if @question_vote.save
		current_user.question_votes << @question_vote
		current_user.save
			q = Question.find(@question_vote.question_id)
			u = q.user
			if @question_vote.positive?
				q.update_attribute(:score, q.score+5)
				if u != nil
					u.puntaje += 5
					u.save
				end
			else
				if u != nil
					u.puntaje -= 2
					if u.puntaje < 1
						u.puntaje = 1
					end
					u.save
				end
				q.update_attribute(:score, q.score-2)
				cu = User.find(current_user.id)
				cu.puntaje -=1
				if cu.puntaje < 1
					cu.puntaje = 1
				end
				cu.save
			end 
			flash[:success] = "El voto se registró con éxito."
			redirect_to q
	else 
		flash[:danger] = "Error al registrar el voto."
		redirect_to questions_path
	end



			end
		else
			flash[:danger] = "No está permitido votar positivo."
			redirect_to questions_path
		end
	else
		if Permit.find_by(name: "Votar negativo").enabled?
			if current_user.permits.find_by(name: "Votar negativo") == nil
				flash[:danger] = "No tiene los permisos necesarios para votar."
				redirect_to questions_path
			else



	@question_vote = QuestionVote.new	
	@question_vote.user_id = current_user.id
	@question_vote.positive = params[:positive]
	@question_vote.question_id = params[:question_id]
	if @question_vote.save
		current_user.question_votes << @question_vote
		current_user.save
			q = Question.find(@question_vote.question_id)
			u = q.user
			if @question_vote.positive?
				q.update_attribute(:score, q.score+5)
				if u != nil
					u.puntaje += 5
					u.save
				end
			else
				if u != nil
					u.puntaje -= 2
					if u.puntaje < 1
						u.puntaje = 1
					end
					u.save
				end
				q.update_attribute(:score, q.score-2)
				cu = User.find(current_user.id)
				cu.puntaje -=1
				if cu.puntaje < 1
					cu.puntaje = 1
				end
				cu.save
			end 
			
			flash[:success] = "El voto se registró con éxito."
			redirect_to q
	else 
		flash[:danger] = "Error al registrar el voto."
		redirect_to questions_path
	end



			end
		else
			flash[:danger] = "No está permitido votar negativo."
			redirect_to questions_path
		end
	end
  end

  def index
  end

  def show
  end
end
