class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc) # この行を追加
      render 'static_pages/home'
    end
  end
  
  def destroy
    @micropost = current_user.microposts.find_by(id: params[:id])
    return redirect_to root_url if @micropost.nil?
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end
  
  def retweet
    @original_micropost = Micropost.find(params[:id])
        if @original_micropost
          @tweet_retweet = current_user.microposts.build(name:
        @original_micropost.name, user_id: @original_micropost.user_id)
            if new_micropost.save
              @retweet = current_user.retweet.build(name: @original_micropost.name, 
                user_id: @original_micropost.user_id, micropost_id: @original_micropost.id )
              redirect_to user_path(current_user)
              flash[:success] = "Retweet Successful"
             else
               redirect_to user_path(current_user), notice: new_micropost.errors.full_messages
            end
        else
          #some error message here
        end
  end
  
  private
  def micropost_params
    params.require(:micropost).permit(:content)
  end
end

