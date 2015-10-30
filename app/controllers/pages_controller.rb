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
      render json: page, status: :created
    else
      render json: page.errors, status: :unprocessable_entity
    end
  end

  def update
    page = Page.find(params[:id])

    if page.update_attributes(page_params)
      render json: page, status: :ok
    else
      render json: page.errors, status: :unprocessable_entity
    end
  end

  private

  def page_params
    params.require(:page).permit(:title, :body)
  end
end
