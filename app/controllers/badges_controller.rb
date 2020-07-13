class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @all = Badge.all

    @badges = current_user.badges
  end

end
