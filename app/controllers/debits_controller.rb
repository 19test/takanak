# -*- coding:utf-8 -*-
class DebitsController < ApplicationController

  def index
    @debits = current_user.debits.find_all_by_status(params[:status])
    respond_to do |format|
      format.html
      format.json { render json: @debits }
    end
  end

  def show
    @debit = current_user.debits.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @debit }
    end
  end

  def new
    @debit = Debit.new
  end


  def edit
    @debit = current_user.debits.find(params[:id])
  end

  def create
    @debit = Debit.new(params[:debit])
    @debit.status = "not_paid"
    alert = @debit.friend.total_not_paid > 0
    if @debit.save
      redirect_to @debit.friend, notice: alert ? "Bu adam seni kazıklıyor. Arkadaş analizi sayfasını incelemelisin." : "Borç eklendi"

    else
      render action: "new"
    end
  end


  def update
    @debit = current_user.debits.find(params[:id])
    if @debit.update_attributes(params[:debit])
      redirect_to @debit.friend, notice: 'Borç güncellendi.'
    else
      render action: "edit"
    end
  end

  def destroy
    @debit = current_user.debits.find(params[:id])
    friend = @debit.friend
    @debit.destroy
    redirect_to friend, notice: "Borç temizlendi."
  end

end
