class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @product = Product.new
    @products = Product.page(params[:page])
    #@products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    #p @product
    if @product.save
      #商品の新規登録成功後その商品の詳細ページへ遷移
      redirect_to admin_product_path(@product), success: "登録に成功しました"
    else
      #バリデーションに引っ掛かる場合は新規登録画面へ遷移
      redirect_to new_admin_product_path, denger: "登録に失敗しました"
    end

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      # 商品編集保存後その商品詳細ページへ遷移
      redirect_to admin_product_path(@product), success: "編集に成功しました"
    else
      #バリデーションに引っ掛かる場合は新規登録画面へ遷移
      redirect_to edit_admin_product_path, denger: "編集に失敗しました"
    end
  end

  private
  def product_params
    params.require(:product).permit(:genre_id, :name, :description, :image, :price, :is_active)
  end


end
