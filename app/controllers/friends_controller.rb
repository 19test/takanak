# -*- coding:utf-8 -*-
class FriendsController < ApplicationController


  def index
    @friends = current_user.friends.paginate(:page => params[:page], :per_page => 8)
    respond_to do |format|
      format.html
      format.json { render json: @friends }
    end
  end


  def show
    @friend = current_user.friends.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @friend }
    end
  end

  def new
    @friend = Friend.new
  end

  def edit
    @friend = current_user.friends.find(params[:id])
  end

  def create
    @friend = Friend.new(params[:friend])
    @friend.user_id = current_user.id

    if @friend.save
      redirect_to @friend, notice: 'Arkadaşa başarıyla şekil yapıldı.'
    else
      render action: "new"
    end
  end

  def update
    @friend = current_user.friends.find(params[:id])
    if @friend.update_attributes(params[:friend])
       redirect_to @friend, notice: 'Arkadaşa başarıyla güncellendi.'
    else
       render action: "edit"
    end
  end

  def destroy
    @friend = current_user.friends.find(params[:id])
    @friend.destroy
    redirect_to friends_url
  end

end
