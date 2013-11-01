class DashboardsController < ApplicationController
  def index
    parser = SheetParser.new()
    @data = parser.parse
    render :index
  end
end