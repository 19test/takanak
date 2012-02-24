class DebitsController < ApplicationController
  # GET /debits
  # GET /debits.json
  def index
    @debits = current_user.debits

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @debits }
    end
  end

  # GET /debits/1
  # GET /debits/1.json
  def show
    @debit = current_user.debits.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @debit }
    end
  end

  # GET /debits/new
  # GET /debits/new.json
  def new
    @debit = Debit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @debit }
    end
  end

  # GET /debits/1/edit
  def edit
    @debit = current_user.debits.find(params[:id])
  end

  # POST /debits
  # POST /debits.json
  def create
    @debit = Debit.new(params[:debit])

    respond_to do |format|
      if @debit.save
        format.html { redirect_to @debit, notice: 'Debit was successfully created.' }
        format.json { render json: @debit, status: :created, location: @debit }
      else
        format.html { render action: "new" }
        format.json { render json: @debit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /debits/1
  # PUT /debits/1.json
  def update
    @debit = current_user.debits.find(params[:id])

    respond_to do |format|
      if @debit.update_attributes(params[:debit])
        format.html { redirect_to @debit, notice: 'Debit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @debit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debits/1
  # DELETE /debits/1.json
  def destroy
    @debit = current_user.debits.find(params[:id])
    @debit.destroy

    respond_to do |format|
      format.html { redirect_to debits_url }
      format.json { head :no_content }
    end
  end
end
