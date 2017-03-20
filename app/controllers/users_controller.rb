class UsersController < ApplicationController
before_action :logged_in_user, only: [:edit, :update]
before_action :set_user, only: [:edit, :update, :destroy]
before_action :select_user, only: [:edit, :update]
  
  def show # 追加
   @user = User.find(params[:id])
   @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"      
      redirect_to @user # ここを修正    
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
    def update
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
 #  followingページ
    def following
      @user  = User.find(params[:id])
      @users = @user.following_users
      render 'show_follow'
  end
 #  followerページ
  def followers
    @user  = User.find(params[:id])
    @users = @user.follower_users
    render 'show_follower'
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :email, :address, :password,
                                 :password_confirmation)
  end

    def set_user
    @user = User.find(params[:id])
  end
  
def select_user
 if current_user.id != params[:id].to_i
   redirect_to root_path
 end
end
  
end