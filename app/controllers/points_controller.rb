require_relative '../models/payer_transactions.rb'

class PointsController < Sinatra::Base

    configure do
        set :public_folder, File.expand_path('../../../public', __FILE__)
        set :views, File.expand_path('../../views', __FILE__)
        @@user_trans = PayerTransactions.new
    end

    get '/' do
        redirect to '/points'
    end

    get '/points' do
        erb :points
    end

    get '/add' do
        erb :add
    end

    post '/add' do
        payer = params[:payer]
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

        @@user_trans.add(payer, points, timestamp)
        @@user_trans.to_s
        #redirect to points balance
    end

    get '/spend' do
        erb :spend
    end

    post '/spend' do
        points = params[:points].to_i

        #@@user_trans.spend(points, @@user_trans.oldest_id)
        @@user_trans.to_s
        #redirect to points balance
    end
end

#root to show available points - GET points
#input new points - GET points/add/new
#spend points - GET points/spend/new
#create transaction - POST points (routes back to points, w/ update)
#no seconds for user ts (doesn't make sense)

#points page:
#if no points, say that
#else, write payer and point values
#write readme
#fix persistent database issue
#deploy to heroku