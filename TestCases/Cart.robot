*** Settings ***
Resource    ../Keywords/cart.robot

*** Test Cases ***
Product Purchase in Cart
    [Documentation]    This scenario outlines the process of purchasing products on an e-commerce website
    Given I access the Automation Exercise website
    When I navigate to the Products page
    And I verify if the search bar is visible
    And I write 'men tshirt' in the search bar
    And I click on the 'search' button
    Then I verify that 'Men Tshirt' is visible in the search results
    And I add the product to the cart
    When I continue shopping
    And I add the item 'Green Side Placket Detail T-Shirt' to the cart
    And I navigate to the Cart page
    Then I verify that the products are visible in the cart
    And I verify that the sum of the product values in the cart is "Rs.1400"