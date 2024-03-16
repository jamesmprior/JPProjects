#Playing around with web elements
Feature: Ecommerce Short Version

After Scenario:
Then I close web browser

Scenario: Login
Given I open "Chrome" web browser
Then I navigate to "https://sales.tryonsolutions.com/pomelo/index.php?route=account/login" in web browser within 25 seconds
When I see "Returning Customer" in web browser within 25 seconds
Then I clear all text in element "name:email" in web browser
And I clear all text in element "name:password" in web browser
Then I type "james.prior@tryonsolutions.com" in element "name:email" in web browser within 25 seconds
And I type "jammrom1" in element "name:password" in web browser within 25 seconds
Then I click element """xPath://*[@id="content"]/div[2]/div[1]/div/form/input""" in web browser within 5 seconds
And I wait 1 seconds




