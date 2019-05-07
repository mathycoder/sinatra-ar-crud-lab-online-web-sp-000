
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles/new' do 
      erb :new 
  end 
 
  get '/articles' do 
    @articles = Article.all 
    erb :index
  end 
  
  post '/articles' do 
    article = Article.create(params)
    redirect "/articles/#{article.id}"
  end 
  
  get '/articles/:id' do 
    id = params[:id]
    @article = Article.find(id)
    erb :show
  end 
  
  get '/articles/:id/edit' do 
    id = params[:id]
    @article = Article.find(id)
    erb :edit 
  end 
  
  patch '/articles/:id' do 
    article = Article.find(params[:id])
    #article.update(title: params[:title], content: params[:content])
    article.update(params)
    redirect "/articles/#{article.id}"
  end 
  
  delete '/articles/:id/delete' do
    article = Article.find(params[:id])
    article.destroy
    redirect "/articles"
  end 
end
