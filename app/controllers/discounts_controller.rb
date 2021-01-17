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
    discount = Discount.create!(
      item_requirement: params[:discount][:item_requirement], 
      percentage_discount: params[:discount][:percentage_discount], 
      merchant_id: merchant.id)

    redirect_to merchant_discounts_path(merchant.id)
  end

  def destroy
    merchant = Merchant.find(params[:merchant_id])
    Discount.destroy(params[:id])
    redirect_to merchant_discounts_path(merchant.id)
  end

  def edit 
    @merchant = Merchant.find(params[:merchant_id])
    @discount = Discount.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:merchant_id])
    @discount = Discount.find(params[:id])
    @discount.update({
      item_requirement: params[:discount][:item_requirement],
      percentage_discount: params[:discount][:percentage_discount]})
    @discount.save
    redirect_to merchant_discount_path(@merchant.id, @discount.id)
  end

  # def update
  #   invoiceItem = InvoiceItem.find(params[:id])
  #   invoiceItem.update!(invoice_item_params)
  #   redirect_to "/merchants/#{invoiceItem.invoice.merchant.id}/invoices/#{invoiceItem.invoice.id}"
  # end

  # private

  # def invoice_item_params
  #   params.require(:invoice_item).permit(:status)
  # end
  # private 

  # def find_merchant
  #   @merchant = Merchant.find(params[:merchant_id])
  # end

  # def find discount
  #   @discount = Discount.find(params[:id])
  # end
end