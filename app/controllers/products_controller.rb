class ProductsController < ApplicationController

	def show
		@product = Product.find_by(id: params[:id])
		render :show
	end

	def index
		@products = Product.all
		render :index
	end

	def new
		@product = Product.new 
		# unless current_user && current_user.admin
		# 	redirect_to "/products"
		# end
	end

	def create
		product = Product.create(name: params[:name], description: params[:description], price: params[:price])
		redirect_to product
	end	

	def edit
	    @product = Product.find_by(id: params[:id])
	    render :edit
	end

	def update
        product = Product.find_by(id: params[:id])
        updated_attributes = ({name: params[:name], description: params[:description], price: params[:price]})
        product.update_attributes(updated_attributes)
        redirect_to product
    end

    def destroy
        product = Product.find_by(id: params[:id])
        product.destroy
        redirect_to danimals_path
    end
	
end
