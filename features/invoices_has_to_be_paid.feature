Feature: Invoices has to be paid to be viewed
  As a company
  In order to get paid
  I must restrict access to invoices

  Background:
    Given the following user exist
      | email         | password |
      | user@user.com | password |

    And the following invoices exist
      | id | date       | due_date             | paid_for | user          |
      | 1  | Date.today | Date.today + 30.days | true     | user@user.com |
      | 2  | Date.today | Date.today + 30.days | false    | user@user.com |

    And I am logged in as "user@user.com"
    And I am on the invoices page

  Scenario: Payed for invoices can be viewed
    When I click on "View invoice 1"
    Then I should see "Invoice no: 1"

  Scenario: User can not see unpayed invoice
    When I click on "View invoice 2"
    Then I should see "You have to pay for this invoice before you can view it"

