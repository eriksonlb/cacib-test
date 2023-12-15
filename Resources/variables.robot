*** Variables ***
${BROWSER}                      Chrome
${URL}                          http://automationexercise.com
${WEBDRIVER_PATH}               webdriver/chromedriver.exe
${PRODUCTS_NAV_BUTTON}          xpath=//a[@href='/products']
${SEARCH_BAR}                   name=search
${SEARCH_BUTTON}                id=submit_search
${ADD_CART_BUTTON}              xpath=//a[contains(., 'Add to cart')]
${CONTINUE_SHOPPING_BUTTON}     xpath=//button[@class='btn btn-success close-modal btn-block']
${CART_NAV_BUTTON}              xpath=//a[@href='/view_cart']
${CART_ITENS_VALUES}            xpath=//p[@class="cart_total_price"]
