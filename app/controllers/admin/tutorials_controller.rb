class Admin::TutorialsController < Admin::BaseController
  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  def create
    tutorial = Tutorial.create(tutorial_params)
    flash[:success] = "Successfully created tutorial"
    redirect_to admin_tutorial_path(tutorial.id)
  end

  def new
    @tutorial ||= Tutorial.new
  end

  def show
    @tutorial = Tutorial.find(params[:id])
  end

  def update
    tutorial = Tutorial.find(params[:id])
    if tutorial.update(tutorial_params)
      flash[:success] = "#{tutorial.title} tagged!"
    end
    redirect_to edit_admin_tutorial_path(tutorial)
  end

  def destroy
    tutorial = Tutorial.find(params[:id])
    tutorial.destroy
    redirect_to admin_dashboard_path
  end

  private
  def tutorial_params
    params.require(:tutorial).permit(:tag_list)
  end
end
