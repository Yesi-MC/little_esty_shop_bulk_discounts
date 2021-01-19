class DiscountsController < ApplicationController
  
  def index 
    @merchant = Merchant.find(params[:merchant_id])
    @discounts = @merchant.discounts
  end

  def show 
    @discount = Discount.find(params[:id])
    @merchant = Merchant.find(params[:merchant_id])
  end

  def new 
    @merchant = Merchant.find(params[:merchant_id])
    @discount = Discount.new 
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    discount = merchant.discounts.new(discount_params)
     if discount.save
      redirect_to merchant_discounts_path(merchant.id)
    else  
      flash.notice = "Discount Incorrectly Entered. Try Again!"
      redirect_to merchant_discounts_path(merchant.id)
    end 
  end

  def edit 
    @merchant = Merchant.find(params[:merchant_id])
    @discount = Discount.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:merchant_id])
    @discount = Discount.find(params[:id])
    if @discount.update(discount_params)
      flash.notice = "Discount Updated Succesfully"
    @discount.save
      redirect_to merchant_discount_path(@merchant.id, @discount.id)
    else 
      flash.notice = "Discount Incorrectly Entered. Try Again!"
      redirect_to merchant_discount_path(@merchant.id, @discount.id)
    end 
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

