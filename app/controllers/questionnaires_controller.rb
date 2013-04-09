class QuestionnairesController < ApplicationController
  # GET /questionnaires
  def index
    @questionnaires = Questionnaire.where(user_id: @current_user.id)
  end

  # GET /questionnaires/1
  def show
    @questionnaire = Questionnaire.find(params[:id])

    unless @questionnaire.user == @current_user
      render file: 'public/403', formats: [:html], status: :forbidden
    end
  end

  # GET /questionnaires/new
  def new
    @questionnaire = Questionnaire.new
  end

  # GET /questionnaires/1/edit
  def edit
    @questionnaire = Questionnaire.find(params[:id])
    
    unless @questionnaire.user == @current_user
      render file: 'public/403', formats: [:html], status: :forbidden
    end
  end

  # POST /questionnaires
  def create
    @questionnaire = Questionnaire.new(params[:questionnaire])
    @questionnaire.user = @current_user
    
    if @questionnaire.save
      redirect_to @questionnaire, notice: 'Questionnaire was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /questionnaires/1
  def update
    @questionnaire = Questionnaire.find(params[:id])

    unless @questionnaire.user == @current_user
      return render file: 'public/403', formats: [:html], status: :forbidden
    end

    if @questionnaire.update_attributes(params[:questionnaire])
      redirect_to @questionnaire, notice: 'Questionnaire was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /questionnaires/1
  def destroy
    @questionnaire = Questionnaire.find(params[:id])
    
    unless @questionnaire.user == @current_user
      return render file: 'public/403', formats: [:html], status: :forbidden
    end
    
    @questionnaire.destroy

    redirect_to questionnaires_url
  end
end
