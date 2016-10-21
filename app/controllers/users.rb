
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

end
