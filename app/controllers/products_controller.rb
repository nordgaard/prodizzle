  class ProductsController < ApplicationController

    def index
      @products = Product.all #array of hashes
      sort_attribute = params[:sort]
      sort_order = params[:order]
      discount = params[:discount]
      if sort_attribute && sort_order
        @products = Product.all.order(sort_attribute => sort_order)
      end
      if discount
        @products = Product.where("price < ?", 10)
      end
      render "index.html.erb"
    end



    def show
      @product = Product.find_by(id: params[:id]) #single hash
      if params[:id] == "random"
        @product = Product.all.sample
      end
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

    def search
      search_text = params[:search]
      @products = Product.where("name LIKE ? OR description LIKE ?", "%#{search_text}%")
      render "index.html.erb"
    end

  end







