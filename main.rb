
require 'sinatra'
require 'sinatra/reloader'
require 'pg'

get '/input_form' do
  db = PG.connect(:dbname => 'sinatra_address_book',
  :host => 'localhost')

  @first_name = params[:first]
  @last_name = params[:last]
  @age = params[:age].to_i
  @gender = params[:gender]

sql = "insert into contacts (first_name, last_name, age, gender)
values ('#{@first_name}', '#{@last_name}', #{@age}, '#{@gender}')"
db.exec(sql)
db.close
erb :input_form
end

