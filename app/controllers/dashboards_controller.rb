class DashboardsController < ApplicationController
  def index
    if current_user.present?
      parser = SheetParser.new(current_user)
      @data = parser.parse
    end
    render :index
  end
end