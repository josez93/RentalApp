class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all
    render "index.json.jb"
  end

  def create
    product = Product.new(
      name: params[:name],
      inventory: params[:inventory],
      image_url: params[:image_url],
      price: params[:price],
    )
    if product.save
      render json: { message: "Product created successfully" }, status: :created
    else
      render json: { errors: product.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @product = Product.find_by(id: params[:id])

    @product.name = params[:name] || @product.name
    @product.inventory = params[:inventory] || @product.inventory
    @product.image_url = params[:image_url] || @product.image_url
    @product.price = params[:price] || @product.price
    @product.save
    render "show.json.jb"
    # if @product.save && authenticate_admin
    #   render "show.json.jb"
    # else
    #   render json: { message: "no" }
    # end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Product is now deleted" }
  end
end
