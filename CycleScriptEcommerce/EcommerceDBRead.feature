#Extract the latest order ID from order history in the Fruit Store database, and grab related information
Feature: Read Fruit Database

Background: Connect
Given I connect to MySQL database "tryonsol_sales_pomelo?serverTimezone=UTC" at "sales.tryonsolutions.com" port 3306 logged in as "tryonsol_sales" with password "mtW#a!GGkg?"

Scenario: Grab Latest Order and Return Customer Order Information
Then I execute SQL "SELECT MAX(order_id) FROM oc_order_history"
Then I assign row 0 column "MAX(order_id)" to variable "orderid"
Then I echo $orderid 

#Pull from oc_order using order_id above
Then I execute SQL "SELECT * FROM oc_order WHERE order_id = " $orderid
And I assign row 0 column "firstname" to variable "first"
And I assign row 0 column "lastname" to variable "last"
And I assign row 0 column "email" to variable "e-mail"
And I assign row 0 column "payment_address_1" to variable "addy"
And I assign row 0 column "payment_city" to variable "city"
And I assign row 0 column "payment_zone" to variable "state"
And I assign row 0 column "payment_postcode" to variable "zip"
And I assign row 0 column "payment_country" to variable "country"
And I assign row 0 column "payment_method" to variable "paytype"
And I assign row 0 column "total" to variable "amount"
Then I assign variable "fullname" by combining "Customer: " $first " " $last
Then I assign variable "address" by combining "At Address: " $addy " " $city ", " $state " " $zip " " $country
Then I assign variable "bottomline" by combining "Bottom Line: " $fullname " " " pays " $amount " for order plus shipping via " $paytype 

#Pull all order_id instances from oc_order_product
Then I execute SQL "SELECT COUNT(*) FROM oc_order_product WHERE order_id = " $orderid
And I assign row 0 column "COUNT(*)" to variable "number"
And I convert string variable "number" to integer variable "number"
Then I execute SQL "SELECT * FROM oc_order_product WHERE order_id = " $orderid

Then I echo $fullname
Then I echo $address

Then I decrease variable "number" by 1
While I verify number $number is greater than or equal to 0
Then I assign row $number column "name" to variable "product"
Then I assign row $number column "quantity" to variable "qty"
Then I assign row $number column "total" to variable "totalperproduct"
Then I assign variable "custorder" by combining "Ordered... " $qty " of " $product " for a total of " $totalperproduct 
Then I echo $custorder
And I wait 1 seconds
Then I decrease variable "number" by 1
EndWhile

Then I echo $bottomline