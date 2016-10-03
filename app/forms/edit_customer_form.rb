class EditCustomerForm < OnForm::Form
  expose %i(name email phone_number), on: :customer

  validates_presence_of :email

  def initialize(customer)
    @customer = customer
  end
end
