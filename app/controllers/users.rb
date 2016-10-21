
class BookmarkManager < Sinatra::Base

  get '/users/sign_up' do
    @user = User.new
    erb :'users/sign_up'
  end

  post '/sign_up' do
    @user = User.create( name: params[:name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/links')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/sign_up'
    end
  end

  get '/users/recover' do
    erb(:'users/recover')
  end

  post '/users/recover' do
    user = User.first(email: params[:email])
    if user
      user.generate_token
    end

    erb :'users/acknowledgement'
  end

  get '/users/reset_password' do
    @user = User.find_by_valid_token(params[:token])
    if(@user)
      session[:token] = params[:token]
      erb :'users/reset_password'
    else
      "Your token is invalid"
    end
  end

  patch '/users' do
     user = User.find_by_valid_token(session[:token])
     if user.update(password: params[:password], password_confirmation: params[:password_confirmation])
       session[:token] = nil
       user.update(password_token: nil)
       redirect "/sessions/sign_in"
     else
       flash.now[:errors] = user.errors.full_messages
       erb :'users/reset_password'
     end
   end

end
