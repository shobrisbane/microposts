class Retweet < ActiveRecord::Base
  belongs_to :retweeter, :class_name => "user"
  belongs_to :retweet, :class_name => "micropost"
end