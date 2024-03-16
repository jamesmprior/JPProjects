#Test various website login possibilities; toggle failure handling
Feature: Ecommerce Login Test

After Scenario:
Then I close web browser

Scenario Outline: Login Check
Datastore Examples: EcommerceLogin

Given I open "Chrome" web browser
Then I navigate to "https://sales.tryonsolutions.com/pomelo/index.php?route=account/login" in web browser within 25 seconds
And I size web browser to 900 x 1030
When I see "Returning Customer" in web browser within 25 seconds
Then I clear all text in element "name:email" in web browser
And I clear all text in element "name:password" in web browser
Then I type <EMAIL> in element "name:email" in web browser within 25 seconds
And I type <PASSWORD> in element "name:password" in web browser within 25 seconds
Then I click element """xPath://*[@id="content"]/div[2]/div[1]/div/form/input""" in web browser within 5 seconds
And I wait 1 seconds
Then I save screenshot

If I see title contains "My Account" in web browser within 3 seconds
  Then I echo "Login Successful"
Else I see "Warning: No match for E-Mail Address and/or Password." in web browser within 3 seconds
  And I fail step with error message "No Match Warning"
Else I fail step with error message "Error"
EndIf