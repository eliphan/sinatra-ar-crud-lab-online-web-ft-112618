
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    redirect to "/articles"
  end  

#create new object in the model class Article, then set it to an instance variable
  get '/articles/new' do
    @article = Article.new
    erb :new
  end
  
  
  
#this will render the index page and show a list of all of the articles
  get '/articles' do
    @articles = Article.all
    erb :index
  end  
   

  
#Active Record will find the article with id number set by the params, grab that article, and set it to the instance variable @article 
   get 'articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end 

  

  
end
