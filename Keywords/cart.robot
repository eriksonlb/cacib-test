*** Settings ***
Resource        ../Resources/variables.robot
Resource        ../Resources/libraries.robot

*** Keywords ***
Given I access the Automation Exercise website
    Open Browser                ${URL}      ${BROWSER}      executable_path=${WEBDRIVER_PATH}
    Maximize Browser Window

When I navigate to the Products page
    Click Link      ${PRODUCTS_NAV_BUTTON}

And I verify if the search bar is visible
    Wait Until Page Contains Element    ${SEARCH_BAR}

And I write '${search_query}' in the search bar
    Input Text      ${SEARCH_BAR}             ${search_query}

And I click on the 'search' button
    Click Button    ${SEARCH_BUTTON}

Then I verify that '${result}' is visible in the search results
    Wait Until Page Contains    ${result}

And I add the product to the cart
    # Because of the ad popup, it's necessary to scroll until footer
    Scroll Element Into View    ${FOOTER_ELEMENT}
    Click Link                  ${ADD_CART_BUTTON}
    
When I continue shopping
    Wait Until Element Is Visible       ${CONTINUE_SHOPPING_BUTTON}
    Click Button                        ${CONTINUE_SHOPPING_BUTTON}

And I add the item '${search_query}' to the cart
    And I verify if the search bar is visible
    Clear Element Text                                                      ${SEARCH_BAR}
    And I write 'Green Side Placket Detail T-Shirt' in the search bar
    And I click on the 'search' button
    Then I verify that '${search_query}' is visible in the search results
    And I add the product to the cart
    When I continue shopping

And I navigate to the Cart page
    Click Link      ${CART_NAV_BUTTON}

Then I verify that the products are visible in the cart
    Wait Until Page Contains    Men Tshirt
    Wait Until Page Contains    Green Side Placket Detail T-Shirt

Check if the sum of the ${itens} is ${step_total}
    #sum the values from a list and compare with expected value
    ${sum}=                         Evaluate    sum(${itens})
    Should Be Equal As Numbers      ${sum}      ${step_total}

And I verify that the sum of the product values in the cart is "${expected_total}"
    #get values of each item from the cart
    ${itens}=       Get WebElements    ${CART_ITENS_VALUES}
    ${values}=      Create List

    #using the FOR to add all values from the cart in a list, after convert to number
    FOR     ${item}                 IN                  @{itens}
            ${value}=               Get Text            ${item}
            ${formated_value}       Remove String       ${value}    Rs. 
            ${float_value}          Convert To Number   ${formated_value}
            Append To List          ${values}           ${float_value}
    END

    #convert string to number, sum and compare the real total with the expected
    ${formated_total}                       Remove String                                   ${expected_total}    Rs.  
    ${total}                                Convert To Number                               ${formated_total}  
    Run Keyword And Continue On Failure     Check if the sum of the ${values} is ${total}

    #get the sum of the items on cart list and log it.
    ${actual_sum}=      Evaluate                                                sum(${values})
    Log                 The sum of the products values is: RS.${actual_sum}
    
    
    
