class Admin::TestsController < Admin::BaseController
  before_action :find_all, only: %i[index update_inline]
  before_action :find_test, only: %i[show destroy edit update update_inline]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.author_tests.new(resource_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: t('.notice', title: @test.title)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(resource_params)
      redirect_to admin_test_path(@test), notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t('.notice')
  end

  def update_inline
    if @test.update(resource_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  private

  def resource_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_all
    @tests = Test.all
  end

  def rescue_with_test_not_found
    render inline: t('errors.tests.not_found'), status: 404
  end
end
