class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :setup_data
  before_action :get_book_id, only: [:show, :update, :destroy]

  def index
    render json: @data
  end

  #Show a single book
  def show
    render json: @data[@book_id]
  end

  #Create a new book
  def create
    @data << { title: params[:title], author: params[:author] }
    index
  end

  #Update a book
  def update
    book = @data[@book_id]
    if book
      book[:title] = params[:title] if params.has_key?(:title)
      book[:author] = params[:author] if params.has_key?(:author)
      render json: @data
    else
      render plain: "Book not found!"
    end
  end

  #Remove a book
  def destroy
    @data.delete_at(@book_id)
    render json: @data
  end

  private

  def setup_data
    @data = [
      { title: "Harry Potter", author: "J.K Rowling" },
      { title: "Name of the wind", author: "Patrick Rothfuss" },
    ]
  end

  def get_book_id
    @book_id = params[:id].to_i
  end
end
