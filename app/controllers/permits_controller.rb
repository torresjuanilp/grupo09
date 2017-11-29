class PermitsController < ApplicationController
  def create
  end

  def show
  end
def update
  @permit = Permit.find(params[:id])

  if @permit.update_attributes(params[:permit])
    redirect_to :action => :show, :id => @post.id
  else
    render 'edit'
  end
end
  def index
  end

def edit
  @permit = Permit.find(params[:id])
end
end
