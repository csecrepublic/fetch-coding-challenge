require 'sinatra'
require 'sinatra/activerecord'

class PayerTransaction < ActiveRecord::Base
    register Sinatra::ActiveRecordExtension

    validates :payer, presence: true
    validates :points, presence: true
    validates :timestamp, presence: true
end