class EditCustomerForm < OnForm::Form
  take_identity_from :customer

  expose %i(name email phone_number), on: :customer
  attribute :email_permission, :boolean, default: false

  validates_presence_of :email
  validates_acceptance_of :email_permission

  def initialize(customer)
    @customer = customer
  end
end
