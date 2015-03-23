get '/' do
	erb :index
end

get '/sessions/new' do
	
  erb :"sessions/new"
end

post '/sessions' do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    session[:id] = @user.id
    redirect "/questions"
  else
    erb :"sessions/new"
  end
end


get '/users/new' do

  erb :"users/new"  
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect "/"
  else
    erb :"users/new"
  end
end


get '/logout' do
	session.clear
	redirect '/'
end

get '/questions/new' do
  if session[:id] == nil || session[:id] != params[:user_id].to_i
    redirect '/users/new'
  else
    @question = Question.new
    erb :"questions/new"
  end
end

post '/questions' do
  @question = Question.new(params[:question])
  if @question.save
    redirect "/questions"
  else
      erb :"questions/new"
  end
end

get "/questions" do
  @questions = Question.all

  erb :"questions/index"
end

get "/questions/:id" do
  if session[:id] == nil || session[:id] != params[:user_id].to_i
    redirect '/users/new'
  else
    @question = Question.find(params[:id])
    @answer = Question.find(params[:id]).answers.find_by(question_id: params[:id])
    @vote = Vote.find_by(parent_id: params[:id])
  erb :"questions/show"
  end
end

get "/questions/:id/edit" do
  if session[:id] == nil || session[:id] != params[:user_id].to_i
    redirect '/users/new'
  else
    @question =  @question = Question.find(params[:id])
    erb :"questions/show"
  end
end

put "/questions/:id" do
  @question = Question.find(params[:id])
  if @question.update(params[:question])
    redirect '/questions'
  else
    erb :"questions/#{@question.id}"
  end
end

delete '/questions/:id' do
   Question.find(params[:id]).destroy
   redirect '/questions'
end




