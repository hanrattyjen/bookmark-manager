
class BookmarkManager < Sinatra::Base
  get '/sessions/sign_in' do
    erb :'sessions/sign_in'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/links')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/sign_in'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to '/links'
  end
end
