require 'sinatra'
require 'rubygems'
require_relative 'lib/credit_calculator'
require_relative 'lib/standart_calculator'
require_relative 'lib/annuity_calculator'

get '/' do
  erb :index
end

post '/calculate' do
  choise = params[:payOff] == 'Usual' ? StandartCalculator : AnnuityCalculator
  @result = choise.new(params[:percent], params[:credit], params[:term])
  @result.calculate
  erb :calculate
end
