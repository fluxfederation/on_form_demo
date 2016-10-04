class EditCustomerForm < OnForm::Form
  take_identity_from :customer

  expose %i(name email phone_number), on: :customer

  validates_presence_of :email

  def initialize(customer)
    @customer = customer
  end
end
