class ProductsController < ApplicationController

  before_filter :get_user
  # :get_student is defined at the bottom of the file,
  # and takes the student_id given by the routing and
  # converts it to an @student object.


  # GET /products
  # GET /products.json
  def index
    @products = @user.products
    # was @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = @user.products.find(params[:id])
    # was @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @user = User.find(params[:user_id])
    @product = @user.products.build
    # was @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = @user.products.find(params[:id])
    #was @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = @user.products.build(params[:product])
    # was @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to user_products_url(@user), notice: 'Product was successfully created.' }
        # format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = @user.products.find(params[:id])
    # was @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to user_products_url(@user), notice: 'Product was successfully updated.' }
        # format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = @user.products.find(params[:id])
    #was @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to (user_products_path(@user)) }
      #was format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
  # get_user converts the user_id given by the routing
  # into an @student object, for use here and in the view.
  def get_user
    @user = User.find(params[:user_id])
  end

end
