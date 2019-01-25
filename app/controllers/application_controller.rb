
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    redirect to "/articles"
  end  

#create new object in the model class Article, then set it to an instance variable. This will not be stored inside @articles
  get '/articles/new' do
    @article = Article.new
    erb :new
  end

#create new object based on the params of the form data created in new.erb. The new object will be stored in @articles. Then redirect the user to the page based on the id number from the params.
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{ @article.id }"
  end
  
#Active Record will find the article with id number set by the params, grab that article, and set it to the instance variable @article 
   get 'articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end 
  
#this will render the index page with an instance varible of all of the articles created
  get '/articles' do
    @articles = Article.all
    erb :index
  end  
  
  

  
end
