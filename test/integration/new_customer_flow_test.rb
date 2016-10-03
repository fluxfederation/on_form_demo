require 'test_helper'

class NewCustomerFlowTest < ActionDispatch::IntegrationTest
  test "can see the customer list and navigate to the form to create a new customer" do
    visit customers_path
    assert page.has_content? "Customers"
    assert page.has_content? customers(:regular_customer).name
    click_on "New customer"
    assert_equal current_path, new_customer_path
  end

  test "can create a customer" do
    visit new_customer_path
    fill_in "Name", with: "Sam Jones"
    fill_in "Phone", with: "1234-5678"
    click_on "Create"

    assert page.has_content?, "Please fix the following errors: Email can't be blank"

    fill_in "Email", with: "test@example.com"
    assert_difference -> { Customer.count } do
      click_on "Create"
      assert !page.has_content?("Please fix the following errors")
      assert page.has_content?("Customers")
      assert page.has_content?("Sam Jones")
    end
    assert Customer.find_by_email("test@example.com")
  end
end
