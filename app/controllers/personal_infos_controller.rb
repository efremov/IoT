class PersonalInfosController < ApplicationController
  # GET /personal_infos
  # GET /personal_infos.json
  before_filter :identify , :except => [:new, :create, :edit, :update]
  before_filter :authenticate_user!
  skip_before_filter :admin, :except => :show
  
  def identify
    if current_user
      unless current_user.personal_info 
        @personal_info = current_user.build_personal_info
        render 'new' 
      end
    end
  end
  
  def index
    @user = User.find(params[:user_id])
    @personal_info = @user.personal_info
    @users_thought = @user.thoughts.order('rate desc').paginate(:page => params[:page])
    @users_quastions = @user.thoughts.paginate(:page => params[:page])
    @folowers = @user.folowers
    @folower = current_user.folowers.where(thinker_id: @user.id).first
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @personal_infos }
    end
  end

  # GET /personal_infos/1
  # GET /personal_infos/1.json
  def show
    @personal_info = current_user.personal_info
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @personal_info }
    end
  end

  # GET /personal_infos/new
  # GET /personal_infos/new.json
  def new
    @personal_info = current_user.build_personal_info

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @personal_info }
    end
  end

  # GET /personal_infos/1/edit
  def edit
    @personal_info = current_user.personal_info
  end

  # POST /personal_infos
  # POST /personal_infos.json
  def create
    @personal_info = current_user.create_personal_info(params[:personal_info])

    respond_to do |format|
      if @personal_info.save
        format.html { redirect_to user_path(current_user), notice: 'Personal info was successfully created.' }
        format.json { render json: @personal_info, status: :created, location: @personal_info }
      else
        format.html { render action: "new" }
        format.json { render json: @personal_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /personal_infos/1
  # PUT /personal_infos/1.json
  def update
    @personal_info = current_user.personal_info

    respond_to do |format|
      if @personal_info.update_attributes(params[:personal_info])
        format.html { redirect_to user_path(current_user), notice: 'Personal info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @personal_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_infos/1
  # DELETE /personal_infos/1.json
  def destroy
    @personal_info = current_user.personal_info
    @personal_info.destroy

    respond_to do |format|
      format.html { redirect_to personal_infos_url }
      format.json { head :no_content }
    end
  end
end
