# -*- coding:utf-8 -*-

STATUS_CHOICES = {"paid"=>"Ödendi.", "not_paid"=>"Ödenmedi."}

class Debit < ActiveRecord::Base
  belongs_to :friend
  validates_inclusion_of :status, :in => STATUS_CHOICES.keys
  validates_numericality_of :amount, :presence => true, :message => '^Numerik bir değer giriniz.'

  def get_status
    STATUS_CHOICES[status]
  end
end
