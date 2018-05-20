class StaticPagesController < ApplicationController
  before_action :time, only: :home
  
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      if params[:day]
        day = DateTime.parse(params[:day])
        #binding.pry
        @microposts = @feed_items.where(
          "updated_at BETWEEN ? AND ?", day, day.end_of_day)
        #binding.pry
      end
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
