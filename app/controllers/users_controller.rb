class UsersController < ApplicationController
before_action :set_user, only: [:edit, :update, :destroy]
  
  def show # 追加
   @user = User.find(params[:id])
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
    current_user.id # 今ログインしている人のIDをとりたい
    #これと
    params[:id] # URLに含まれているID /users/4/editなら4が入る
    # を比較して、一致していなかったら、トップページにリダイレクト
    
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

  private

  def user_params
    params.require(:user).permit(:name, :profile, :email, :address, :password,
                                 :password_confirmation)
  end

    def set_user
    @user = User.find(params[:id])
  end
end