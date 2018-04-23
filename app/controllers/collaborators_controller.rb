class CollaboratorsController < ApplicationController
  def new
    @collaborator = Collaborator.new
  end

  def create
    @collaborator_user = User.find_by_email(params[:collaborator])
    @wiki = Wiki.find(params[:wiki_id])

    if @wiki.collaborators.exists?(user_id: @collaborator_user.id)
      flash[:notice] = "#{@collaborator_user.email} is already a collaborator."
      redirect_to edit_wiki_path(@wiki)
    else
      @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: @collaborator_user.id)
      if @collaborator.save
        flash[:notice] = "#{@collaborator_user.email} was added as a collaborator."
        redirect_to edit_wiki_path(@wiki)
      else
        flash[:alert] = "There was an error adding this collaborator. Please try again."
        redirect_to edit_wiki_path(@wiki)
      end
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
    @collaborator_user = User.find(@collaborator.user_id)

    if @collaborator.destroy
      flash[:notice] = "#{@collaborator_user.email} was removed as a collaborator."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:alert] = "There was an error removing this collaborator. Please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end
end
