class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  impressionist :actions=>[:show]
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @products = Product.all.order('created_at DESC').where(["name ilike ?", "%#{params[:search]}%"]).paginate(page: params[:page], per_page: 12)
  end
  
  def show
    impressionist @product
  end

  def new
    @product = current_user.products.build
  end

  def edit
    authorize! :edit, @product
  end

  def create
    authorize! :create, @product
    @product = current_user.products.build(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully saved." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize! :update, @product
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :destroy, @product
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :before_price, :after_price, :availiability, :image, :description, :category_id, :user_id)
    end
end
