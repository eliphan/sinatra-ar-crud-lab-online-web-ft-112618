
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    redirect to "/articles"
  end  

#this will render the index page with 
  get '/articles' do
    @articles = Article.all
    erb :index
  end  
  
  #create new object in the model class Article, then set it to an instance variable
  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  
  post '/articles' do
    Article.create(params)
    erb :index
  end
  

  
  get 'articles/:id' do
    @articles = Article.find(params[:id])
    erb :show
  end
  
end
