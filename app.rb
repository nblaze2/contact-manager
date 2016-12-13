require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

require_relative 'models/contact'
also_reload 'models/contact'

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  redirect '/contacts'
end

get '/contacts' do
  @contacts = Contact.limit(5)
  erb :index
end

get '/contacts/:page_num' do
  page_num = params[:page_num].to_i
  @contacts = Contact.limit(5).offset(5 * (page_num - 1))
  erb :index
end

get '/contacts/:id' do
  @idv_contact = Contact.find(params[:id])
  erb :show
end
