class PagesController < ApplicationController
  def index
    pages = Page.all
    respond_to do |format|
      format.json  { render json: pages }
    end
  end

  def create
    page = Page.new(page_params)

    if page.save
      head :created
    else
      render json: page.errors, status: :unprocessable_entity
    end
  end

  private

  def page_params
    params.require(:page).permit(:title, :body)
  end
end
