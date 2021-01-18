class DiscountsController < ApplicationController
  # before_action :find_merchant, only: [:index]
  # before_action :find_discount, only: [:show]
  
  def index 
    @merchant = Merchant.find(params[:merchant_id])
    @discounts = @merchant.discounts
  end
  # def index 
  #   @discounts = @merchant.discounts
  # end

  def show #if using before acion would just be empty 
    @discount = Discount.find(params[:id])
    @merchant = Merchant.find(params[:merchant_id])
  end

  def new 
    @merchant = Merchant.find(params[:merchant_id])
    @discount = Discount.new 
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    discount = merchant.discounts.create!(discount_params)

    redirect_to merchant_discounts_path(merchant.id)
  end

  def edit 
    @merchant = Merchant.find(params[:merchant_id])
    @discount = Discount.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:merchant_id])
    @discount = Discount.find(params[:id])
    @discount.update(discount_params)

    @discount.save
    redirect_to merchant_discount_path(@merchant.id, @discount.id)
  end

  def destroy
    merchant = Merchant.find(params[:merchant_id])
    Discount.destroy(params[:id])
    redirect_to merchant_discounts_path(merchant.id)
  end

  private 

  def discount_params
    params.require(:discount).permit(:item_requirement, :percentage_discount)
  end
  
end 

  # private 

  # def find_merchant
  #   @merchant = Merchant.find(params[:merchant_id])
  # end

  # def find discount
  #   @discount = Discount.find(params[:id])
  # end
