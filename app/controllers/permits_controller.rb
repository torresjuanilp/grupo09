class PermitsController < ApplicationController



  def create
  end

  def show
  end


def update
  @permit = Permit.find(params[:id])

  if @permit.update_attributes(params[:permit])
    redirect_to :action => :show, :id => @permit.id
  else
    render 'edit'
  end
end
  def index
  end

def edit
  @permit = Permit.find(params[:id])
end
private 
	def permit_params
    	params.require(:permit).permit(:name, :descripcion, :score)
  end

end
