class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @form = NewCustomerForm.new
  end

  def create
    @form = NewCustomerForm.new
    if @form.update(params[:new_customer_form])
      redirect_to customers_path
    else
      flash.now[:error] = "Please fix the following errors: " + @form.errors.full_messages.to_sentence
      render :action => 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
    @form = EditCustomerForm.new(@customer)
  end

  def update
    @customer = Customer.find(params[:id])
    @form = EditCustomerForm.new(@customer)
    if @form.update(params[:edit_customer_form])
      redirect_to customers_path
    else
      flash.now[:error] = "Please fix the following errors: " + @form.errors.full_messages.to_sentence
      render :action => 'edit'
    end
  end
end
