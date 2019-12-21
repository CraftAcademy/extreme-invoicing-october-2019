@javascript
Feature: User can create invoice
  As a registered user
  In order to send an invoice to my customer
  I would like to be able to create an invoice

  Background:
    Given the following user exist
      | email         | password |
      | user@user.com | password |

    And the following customers exist
      | name     | organisation_number | address  | postcode | city     | user          |
      | ACME AB  | 123456-7890         | Street 1 | 12345    | Cityname | user@user.com |
      | Craft AB | 999999-7890         | Street 1 | 12345    | Cityname | user@user.com |

    And the following articles exist
      | name        | unit_price | user          |
      | Programming | 100        | user@user.com |

  Scenario: Logged in user can create an invoice
    Given I am logged in as "user@user.com"
    And I am on the index page
    And I click on "Create invoice"
    And I select "Craft AB" from "Customer"
    And I click on "Add row"
    And I select "Programming" from "Article"
    And I fill in "Quantity" with "10"
    When I click on "Save row"
    Then I should see "Total incl. VAT 1000kr"

  Scenario: Visitor can not create an invoice
    And I try to visit the invoice create page
    Then I should see "You need to sign in or sign up before continuing."