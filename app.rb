require "sinatra/base"

class Birthday < Sinatra::Base
enable :sessions

get '/' do
  erb :index
end

post '/info' do
  session[:name_one] = params[:name]
  session[:day_one] = params[:day]
  session[:month_one] = params[:month]
  redirect('/display')
end

get '/display' do
  @name = session[:name_one]
  @day = session[:day_one]
  @month = session[:month_one]
  @birthday = Date.new(2019, @month.to_i, @day.to_i)
  erb(:display)
end

run! if app_file == $0
end
