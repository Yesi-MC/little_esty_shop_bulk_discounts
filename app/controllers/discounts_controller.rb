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
  end

  def new 
    
  end

  # private 

  # def find_merchant
  #   @merchant = Merchant.find(params[:merchant_id])
  # end

  # def find discount
  #   @discount = Discount.find(params[:id])
  # end
end