require './config/environment'
require './app/models/sample_model'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    return erb :index
  end
  
    post  '/results' do
   answers = params.values #"value" in index
   @total= 0 #at the beginning of the quiz
   answers.each do |answer| #goes to the array of values
     @total += answer.to_i #adds up numbers that user chose -- also` convert to integer bc we're taking in numbers
   end
   puts @total

   @combo = cool_generator(@total) #refers to the method cool generator we defined in samplemodel 
                                   #-- @total is the argument the method takes in
   if @combo == "not_cool"
     erb :not_cool
   elsif @combo == "cool"
     erb :cool
  end

end
end