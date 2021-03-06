require 'sinatra'
require 'sinatra/activerecord'

class Payer < ActiveRecord::Base
    register Sinatra::ActiveRecordExtension

    validates :name, presence: true
    validates :points, presence: true
end