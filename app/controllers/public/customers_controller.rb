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

  def check
  end
end
