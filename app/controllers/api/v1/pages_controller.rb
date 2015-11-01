module Api
  module V1
    class PagesController < ApplicationController
      def index
        pages = Page.all
        respond_to do |format|
          format.json  { render json: pages }
        end
      end

      def show
        page = Page.find(params[:id])

        render json: page
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

      def destroy
        page = Page.find(params[:id])
        page.destroy

        render json: page, status: :ok
      end

      private

      def page_params
        params.require(:page).permit(:title, :body)
      end
    end
  end
end
