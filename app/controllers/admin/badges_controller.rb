class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: [:show, :edit, :update, :destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def edit; end

  def create
    @badge = Badge.new(resource_params)

    if @badge.save
      redirect_to admin_badges_path, notice: 'Badge was successfully created.'
    else
      render :new
    end
  end

  def update
    if @badge.update(resource_params)
      redirect_to admin_badges_path, notice: 'Badge was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: 'Badge was successfully destroyed.'
  end

  private
    def set_badge
      @badge = Badge.find(params[:id])
    end

    def resource_params
      params.require(:badge).permit(:title, :image, :description, :badge_rule_id)
    end
end
