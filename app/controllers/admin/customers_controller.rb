class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
     redirect_to admin_customer_path(@customer), notice: "顧客情報を更新しました"
    else
     render :edit
    end
  end
  
  def order
     @customer = Customer.find(params[:id])
     @orders = @customer.orders.page(params[:page])
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:furigana_last_name,:furigana_first_name,
                                     :post_code,:address,:telephone_number,:email,:is_deleted)
  end
  
end