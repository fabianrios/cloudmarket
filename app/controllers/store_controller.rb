class StoreController < ApplicationController

  before_filter :get_user #encontrar un usuario solo si esa logueado


  def index
    @products = Product.all
    @users = User.all
    @product = @user.products.build(params[:product]) # para pasarselo al form de crear producto
    # was @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end
  
  def create
    @product = @user.products.build(params[:product])
    # was @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to store, notice: 'El producto fue creado.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  # get_user converts the user_id given by the routing
  # into an @user object, for use here and in the view.

  def get_user
      if current_user.id
        @user = User.find(current_user.id)
      end
  end
  
  
end
