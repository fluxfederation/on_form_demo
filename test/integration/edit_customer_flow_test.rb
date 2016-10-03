require 'test_helper'

class NewCustomerFlowTest < ActionDispatch::IntegrationTest
  test "can see the customer list and navigate to the form to edit a customer" do
    visit customers_path
    assert page.has_content? "Customers"
    assert page.has_content? customers(:regular_customer).name
    click_on "Edit"
    assert_equal current_path, edit_customer_path(customers(:regular_customer))
  end

  test "can update a customer" do
    visit edit_customer_path(customers(:regular_customer))
    fill_in "Email", with: ""
    click_on "Update"

    assert page.has_content?, "Please fix the following errors: Email can't be blank"

    fill_in "Email", with: "new@example.com"
    assert_no_difference -> { Customer.count } do
      click_on "Update"
      assert !page.has_content?("Please fix the following errors")
      assert page.has_content?("Customers")
      assert page.has_content?("new@example.com")
    end
    assert Customer.find_by_email("new@example.com")
  end
end
