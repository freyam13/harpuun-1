class StartersController < ApplicationController
  # GET /starters
  # GET /starters.json
  
  before_filter :require_starter, :only => [ :show, :edit, :update, :destroy ]
  before_filter :require_admin, :only => :index
  before_filter :logged_in_already?, :only => :new
  
  def index
    @starters = Starter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @starters }
    end
  end

  # GET /starters/1
  # GET /starters/1.json
  def show
    # @starter = current_starter
    @actual_project = @starter.actual_project
    
    @skill1 = Skill.find_by_id(@starter.skill_id1)
    @skill2 = Skill.find_by_id(@starter.skill_id2)
    @skill3 = Skill.find_by_id(@starter.skill_id3)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @starter }
    end
  end

  # GET /starters/new
  # GET /starters/new.json
  def new
    @starter = Starter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @starter }
    end
  end

  # GET /starters/1/edit
  def edit
    # @starter = current_starter
  end

  # POST /starters
  # POST /starters.json
  def create
    @starter = Starter.new(params[:starter])

    respond_to do |format|
      if @starter.save
        session[:starter_id] = @starter.id
        format.html { redirect_to @starter, notice: 'Starter was successfully created.' }
        format.json { render json: @starter, status: :created, location: @starter }
      else
        format.html { render action: "new" }
        format.json { render json: @starter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /starters/1
  # PUT /starters/1.json
  def update
    @starter = current_starter

    respond_to do |format|
      if @starter.update_attributes(params[:starter])
        format.html { redirect_to @starter, notice: 'Starter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @starter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /starters/1
  # DELETE /starters/1.json
  def destroy
    @starter = current_starter
    @starter.destroy

    respond_to do |format|
      format.html { redirect_to starters_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def require_starter
    if current_starter.nil? || current_starter.id != params[:id].to_i
      redirect_to root_url, :notice => "You're not authorized to see this page"
      return
    end
  end
  
end
