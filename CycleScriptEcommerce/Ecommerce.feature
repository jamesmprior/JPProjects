#Read existing customer info from CSV file, assume empty cart, select fruit, checkout, verify log file, verify e-mail, and then extract full order from the database using either EcommerceDBRead.feature and/or extract the products ordered via the ETL tool w/ EcommerceDB.cycextract
#Longer version; Waits included for demo purposes
Feature: Opencart Ecommerce

Background: Test Setup
Given I "Import scenarios, assign variables, and import data"
Then I assign values in row 2 from "\Data\cust.csv" to variables
And I assign "2" to variable "briefwait"
And I assign "3" to variable "mailserverdelay"

Scenario: Login
Given I open "Chrome" web browser
Then I navigate to "http://sales.tryonsolutions.com/pomelo/" in web browser within 25 seconds
And I size web browser to 905 x 1035
When I see title contains "Pomelo Exotic Fruit Shop" in web browser within 25 seconds
Then I press keys TAB 4 times with 1 seconds delay
And I press keys enter
Then I wait 5 seconds
Then I press keys TAB 2 times with 0 seconds delay
And I press keys enter
Then I "Enter info from CSV file"
Then I type $email in element "name:email" in web browser within 25 seconds
Then I press keys TAB
Then I type $password in element "name:password" in web browser within 25 seconds
Then I press keys TAB 2 times with 1 seconds delay
And I press keys enter
Then I wait $briefwait seconds
Then I press keys TAB 7 times with 0 seconds delay
And I press keys enter
Then I wait $briefwait seconds

Then "Select Fruits"
Then "Review Cart"
Then "Order Verification"

@wip
Scenario: Select Fruits
#Then I click "Image:images\pomeloB.png" with correlation 80 within 25 seconds
Then I click element """xPath://*[@id="content"]/div[1]/div[2]/div[2]/div/div[1]/a/img""" in web browser within 15 seconds
Then I wait $briefwait seconds
Then I clear all text in element "id:input-quantity" in web browser within 25 seconds
And I type "3" in element "id:input-quantity" in web browser
Then I press keys TAB
And I press keys enter 1 times with 1 seconds delay
Then I navigate BACK in web browser
Then I wait $briefwait seconds
Then I press keys space
#Then I click "Image:images\jackfruitB.png" with correlation 80 within 25 seconds
Then I click element "text:Jackfruit" in web browser within 15 seconds
Then I wait $briefwait seconds
Then I clear all text in element "id:input-quantity" in web browser within 25 seconds
And I type "1" in element "id:input-quantity" in web browser
Then I press keys TAB
And I press keys enter 1 times with 1 seconds delay
Then I navigate BACK in web browser 
Then I wait $briefwait seconds
Then I press keys space
#Then I click "Image:images\rambutanB.png" with correlation 80 within 25 seconds
Then I click element "text:Rambutan" in web browser within 15 seconds
Then I wait $briefwait seconds
Then I clear all text in element "id:input-quantity" in web browser within 25 seconds
And I type "4" in element "id:input-quantity" in web browser
Then I press keys TAB
And I press keys enter 1 times with 1 seconds delay

@wip
Scenario: Review Cart
Then I click element """xPath://*[@id="cart-total"]""" in web browser within 25 seconds
Then I wait 4 seconds
Then I click element """xPath://*[@id="cart"]/ul/li[2]/div/p/a[2]/strong""" in web browser within 25 seconds
Then I wait $briefwait seconds
Then I scroll to element "id:button-payment-address" in web browser within 10 seconds
Then I click element "id:button-payment-address" in web browser within 10 seconds
Then I wait $briefwait seconds
Then I scroll to element "id:button-shipping-address" in web browser within 10 seconds
Then I click element "id:button-shipping-address" in web browser within 10 seconds
Then I wait $briefwait seconds
Then I scroll to element "id:button-shipping-method" in web browser within 10 seconds
Then I click element "id:button-shipping-method" in web browser within 10 seconds
Then I wait $briefwait seconds
Then I click element "name:agree" in web browser
Then I scroll to element "id:button-payment-method" in web browser within 10 seconds
Then I click element "id:button-payment-method" in web browser within 10 seconds
Then I wait 3 seconds
And I press keys enter
If I see "Jackfruit" in web browser within 25 seconds
  Then I echo "Success"
Else I do not see "Jackfruit" in web browser within 25 seconds
  Then I fail step with error message "The payment method button bug is back!"
  Then I save screenshot
EndIf
Then I wait $briefwait seconds

@wip
Scenario: Order Verification
Then I press keys space
Then I click element "id:button-confirm" in web browser within 25 seconds
When I see "Your order has been successfully processed!" in web browser within 25 seconds
Then I save screenshot
Then I wait $briefwait seconds
Then I close web browser

Scenario: Database Verification
Given I connect to MySQL database "tryonsol_sales_pomelo?serverTimezone=UTC" at "sales.tryonsolutions.com" port 3306 logged in as "tryonsol_sales" with password "mtW#a!GGkg?"
Then I execute SQL "SELECT MAX(order_id) FROM oc_order_history"
Then I assign row 0 column "MAX(order_id)" to variable "orderid"
Then I execute SQL "SELECT * FROM oc_order WHERE order_id = " $orderid
And I assign row 0 column "total" to variable "amount"
When I verify number $amount is greater than 8
Then I close SQL connection

Scenario: Terminal Log Verification
Given I open terminal with SSH encryption connected to "pdci-ssh-linux.tryonsolutions.com:22" logged in as "cycle-sales-demo" "z8L2s4nmwX" sized to 20 lines and 80 columns
And I wait 2 seconds
Then I enter "head public_html/pomelo/payment.log" in terminal
When I see "Order" in terminal within 5 seconds
And I see "11.00" in terminal within 5 seconds
Then I wait 8 seconds
Then I close terminal

# Scenario: E-mail Verification
# Given I open app "Outlook" at "Outlook"
# Then I press keys "WIN-Up" in app 1 times with 1 seconds delay
# Then I wait $mailserverdelay seconds
# Then I double click 1st object "xPath://DataItem[@ClassName='LeafRow']" in app
# Then I wait 1 seconds
# When I see value "Order" is contained in object "automationId:Body" in app
# Then I wait 1 seconds
# Then I close app