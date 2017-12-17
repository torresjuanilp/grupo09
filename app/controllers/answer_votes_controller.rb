class AnswerVotesController < ApplicationController
  def create
	@answer_vote = AnswerVote.new	
	@answer_vote.user_id = current_user.id
	@answer_vote.positive = params[:positive]
	@answer_vote.answer_id = params[:answer_id]
	if @answer_vote.positive? 
		if Permit.find_by(name: "Votar positivo").enabled?
			if current_user.permits.find_by(name: "Votar positivo") == nil
				flash[:danger] = "No tiene los permisos necesarios para votar."
				redirect_to questions_path
			else
				if @answer_vote.save
					current_user.answer_votes << @answer_vote
					current_user.save
					a = Answer.find(@answer_vote.answer_id)
					u = a.user
					#VOTO POSITIVO
					a.update_attribute(:score, a.score+10)
					if u != nil
						u.puntaje += 10
						u.save
					end
					flash[:success] = "El voto se registró con éxito."
					redirect_to a.question
				else
					flash[:danger] = "Error al registrar el voto."
					redirect_to a.question
				end
			end
		else
			flash[:danger] = "No está permitido votar positivo."
			redirect_to a.question
		end
	else
		if Permit.find_by(name: "Votar negativo").enabled?
			if current_user.permits.find_by(name: "Votar negativo") == nil
				flash[:danger] = "No tiene los permisos necesarios para votar."
				redirect_to questions_path
			else
				if @answer_vote.save
					current_user.answer_votes << @answer_vote
					current_user.save
					a = Answer.find(@answer_vote.answer_id)
					u = a.user
					#VOTO NEGATIVO
					a.update_attribute(:score, a.score-2)
					if u != nil
						u.puntaje -= 2
						if u.puntaje < 1
							u.puntaje = 1
						end
						u.save
					end
					cu = User.find(current_user.id)
					cu.puntaje -=1
					if cu.puntaje < 1
						cu.puntaje = 1
					end
					cu.save
					flash[:success] = "El voto se registró con éxito."
					redirect_to a.question
				else
					flash[:danger] = "Error al registrar el voto."
					redirect_to a.question
				end
			end
		else
			flash[:danger] = "No está permitido votar negativo."
			redirect_to a.question
		end
	end
					
  end
end
