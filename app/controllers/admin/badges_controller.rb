class Admin::BadgesController < Admin::BaseController

  before_action :set_all_rule_badges

  def index; end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.build(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t('.create_success')
    else
      flash[:alert] = t('.create_failed')
      render :new
    end
  end

  private

  def set_all_rule_badges
    @badges = Badge.all
  end

  def badge_params
    params.require(:badge).permit(:picture, :name, :type, :filter_value)
  end
end