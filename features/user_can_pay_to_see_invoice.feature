@javascript
Feature: User can pay to receive invoice
  As a user
  In order to receive my created invoice
  I would need to perform a payment

  Background:
    Given the following user exist
      | email         | password |
      | user@user.com | password |

    And the following invoices exist
      | id | date       | due_date             | paid_for | user          |
      | 1  | Date.today | Date.today + 30.days | false    | user@user.com |

    And I am logged in as "user@user.com"
    And I am on the invoices page

  Scenario: User can pay to unlock invoice
    When I click on "Pay Invoice 1"
    And I am on the payment page
    And I fill in the Stripe form field "Card number" with "4242424242424242"
    And I fill in the Stripe form field "Expiry date" with "1220"
    And I fill in the Stripe form field "CVC" with "1220"
    And I click on "Pay for Invoice 1"
    And I should see "Invoice payed! You can access your invoice."