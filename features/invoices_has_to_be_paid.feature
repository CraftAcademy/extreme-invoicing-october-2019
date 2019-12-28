Feature: Invoices has to be paid to be viewed
  As a company
  In order to get paid
  I must restrict access to invoices

  Background:
    Given the following user exist
      | email         | password |
      | user@user.com | password |

    And the following invoices exist
      | invoice_number | paid_for | user          |
      | 1001           | true     | user@user.com |
      | 1002           | false    | user@user.com |

    And I am logged in as "user@user.com"
    And I am on the invoices page

  Scenario: Payed for invoices can be viewed
    When I click on "View invoice 1001"
    Then I should see "Invoice no: 1001"

  Scenario: User can not see unpayed invoice
    When I click on "View invoice 1002"
    Then I should see "You have to pay for this invoice before you can view it"

