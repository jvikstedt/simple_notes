class SimpleNotesController < ApplicationController
  def index
    render text: '', layout: 'angular'
  end
end
