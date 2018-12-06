class Admin::BadgeRulesController < Admin::BaseController
  before_action :set_badge_rule, only: [:edit, :update, :destroy]

  def index
    @badge_rules = BadgeRule.all
  end

  def new
    @badge_rule = BadgeRule.new
  end

  def edit; end

  def create
    @badge_rule = BadgeRule.new(resource_params)

    if @badge_rule.save
      redirect_to admin_badge_rules_path, notice: 'Badge rule was successfully created.'
    else
      render :new
    end
  end

  def update
    if @badge_rule.update(resource_params)
      redirect_to admin_badge_rules_path, notice: 'Badge rule was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @badge_rule.destroy
    redirect_to admin_badge_rules_path, notice: 'Badge rule was successfully destroyed.'
  end

  private
    def set_badge_rule
      @badge_rule = BadgeRule.find(params[:id])
    end

    def resource_params
      params.require(:badge_rule).permit(:rule, :argument, :description)
    end
end
