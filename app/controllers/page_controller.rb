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