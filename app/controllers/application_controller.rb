require_relative '../models/payer.rb'
require_relative '../models/payer_transaction.rb'
require 'sinatra'
require 'sinatra/activerecord'

class ApplicationController < Sinatra::Base
    configure do
        set :database, '../db/database'
        set :public_folder, File.expand_path('../../../public', __FILE__)
        set :views, File.expand_path('../../views', __FILE__)
    end

    get '/' do
        redirect to '/points'
    end

    get '/points' do
        @payer_table = Payer.all
        erb :points
    end

    get '/add' do
        erb :add
    end

    post '/add' do
        payer = params[:payer].upcase
        points = params[:points].to_i

        ts_month = params[:ts_month]
        ts_day = params[:ts_day]
        ts_year = params[:ts_year]
        ts_hour = params[:ts_hour]
        ts_min = params[:ts_min]

        ts_vals_null = ts_month == nil || ts_day == nil || ts_year == nil || ts_hour == nil || ts_min == nil

        unless ts_vals_null 
            timestamp = Time.new(ts_year, ts_month, ts_day, ts_hour, ts_min)
        else
            timestamp = Time.now
        end

        @payer_table = Payer.all

        unless @payer_table.exists?(name: name)
            @payer_table.create(name: name, points: pts)
        end

        current_pts = @payer_table.find_by(name: name).select(:points)
        new_pts = current_pts + pts
        @payer_table.find_by(name: name).update(points: new_pts)

        PayerTransaction.create(payer: name, points: pts, timestamp: timestamp)
        
        redirect to '/points'
    end

    get '/spend' do
        erb :spend
    end

    post '/spend' do
        points = params[:points].to_i

        unless PayerTransaction.first.present?
            "Oops! You can't spend without adding points first."
        end

        @ordered_pt_table = PayerTransaction.order(:timestamp)

        @ordered_pt_table.all.each do |trans|
            this_payer = trans.select(:payer)
            current_pts = @payer_table.find_by(name: name).select(:points)

            if(points <= current_pts)
                this_payer.updated(points: (current_pts - points))
                break
            end

            "Sorry, looks like you don't have enough points in your balance."
        end
        
        redirect to '/points'
    end
end