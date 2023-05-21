class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)

  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.find(params[:id])
    @customer.save

  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to customers_mypage_path
  end

  def check
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :furigana_last_name, :furigana_first_name, :post_code, :adress, :telephone_number, :email)
  end
end
