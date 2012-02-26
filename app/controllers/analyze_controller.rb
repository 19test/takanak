class AnalyzeController < ApplicationController
  def index
    @max_paid_amount = current_user.debits.order("-amount").where("status='paid'").limit(1).first
    @max_not_paid_amount = current_user.debits.order("-amount").where("status='not_paid'").limit(1).first

    # todo: need sql-like queries instead of ruby skills for performance
    @total_debit = current_user.friends.map{|friend| friend.total_debit}.inject(:+)
    @total_paid = current_user.friends.map{|friend| friend.total_paid }.inject(:+)
    @total_not_paid = current_user.friends.map{|friend| friend.total_not_paid }.inject(:+)
  end
end