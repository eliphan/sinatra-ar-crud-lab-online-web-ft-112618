
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    redirect to "/articles"
  end  

#this will render the index page with an instance varible of all of the articles created by the action below
  get '/articles' do
    @articles = Article.all
    erb :index
  end  
  
#create new object in the class Article in the article model, then set it to an instance variable. This will be stored inside @articles
  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{ @article.id }"
    erb :index
  end
  

  
  get 'articles/:id' do
    @articles = Article.find(params[:id])
    erb :show
  end
  
end
