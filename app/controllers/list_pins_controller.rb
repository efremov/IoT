class ListPinsController < ApplicationController
  # GET /list_pins
  # GET /list_pins.json
  def index
    @list_pins = ListPin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @list_pins }
    end
  end

  # GET /list_pins/1
  # GET /list_pins/1.json
  def show
    @list_pin = ListPin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list_pin }
    end
  end

  # GET /list_pins/new
  # GET /list_pins/new.json
  def new
    @list_pin = ListPin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @list_pin }
    end
  end

  # GET /list_pins/1/edit
  def edit
    @list_pin = ListPin.find(params[:id])
  end

  # POST /list_pins
  # POST /list_pins.json
  def create
    @list_pin = ListPin.new(params[:list_pin])

    respond_to do |format|
      if @list_pin.save
        format.html { redirect_to @list_pin, notice: 'List pin was successfully created.' }
        format.json { render json: @list_pin, status: :created, location: @list_pin }
      else
        format.html { render action: "new" }
        format.json { render json: @list_pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /list_pins/1
  # PUT /list_pins/1.json
  def update
    @list_pin = ListPin.find(params[:id])

    respond_to do |format|
      if @list_pin.update_attributes(params[:list_pin])
        format.html { redirect_to @list_pin, notice: 'List pin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @list_pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_pins/1
  # DELETE /list_pins/1.json
  def destroy
    @list_pin = ListPin.find(params[:id])
    @list_pin.destroy

    respond_to do |format|
      format.html { redirect_to list_pins_url }
      format.json { head :no_content }
    end
  end
end
