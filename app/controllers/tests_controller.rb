class TestsController < ApplicationController

  def index
    @tests = Test.all

    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @test = Test.find(params[:id])
    respond_to do |format|
      format.html
      format.json
    end
  end
end
