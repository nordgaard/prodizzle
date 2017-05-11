class ProductsController < ApplicationController

  def index
    @products = Product.all #array of hashes
    render "index.html.erb"
  end

  def show
    product_id = params[:id]
    @product = Product.find(product_id) #single hash
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    new_product = Product.create(
      name: params[:name], 
      price: params[:price],
      description: params[:description]
      )
    flash[:success] = "Product successfully created!"
    redirect_to "/products/#{new_product.id}"
  end

  def edit
    @product = Product.find(params[:id]) #single hash
    render "edit.html.erb"
  end

  def update
    product = Product.find(params[:id])

    product.update(
      name: params[:name], 
      price: params[:price],
      description: params[:description]
      )
    flash[:info] = "Product successfully updated!"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:danger] = "Product successfully deleted!"
    redirect_to "/products"
  end

end







