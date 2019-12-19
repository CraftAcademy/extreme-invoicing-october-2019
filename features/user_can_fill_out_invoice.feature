Feature: User can fill out invoice
  As a user
  In order to get the invoice that I need
  I need the app to be able to generate a invoice dependent on my input

  Background:
    Given the following user exist
      | email         | password |
      | user@user.com | password |

    And the following customers exist
      | name    | organisation_number | address  | postcode | city     | user          |
      | ACME AB | 123456-7890         | Street 1 | 12345    | Cityname | user@user.com |

    And I am logged in as "user@user.com"
    And I am on the index page
    And I click on "Create new invoice"

  Scenario: User can fill out invoice with customer and articles
    When I click on "Edit invoice" for "Invoice 1"
    And I select "ACME AB" from "Customer"
    And I fill in "Item" with "Article"
    And I fill in "Quantity" with "10"
    And I fill in "Unit" with "pcs"
    And I fill in "Unit price" with "1000"
    And I fill in "VAT" with "25"
    When I click on "Save draft"
    Then I should see "Total incl. VAT 12 500,00"
    Then I should see "Invoice draft successfully saved"
    And I should be on the index page
    And I should see "Amount: 12 500,00"
