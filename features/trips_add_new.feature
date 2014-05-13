Feature: As a customer, so that I can create itineraries of my activities, I want to make a trip

Background:
  Given I am signed in as a customer

Scenario: If a customer does not have any trips, they should be redirected to add a trip
  Given a customer visits the "customer_profile" page
  When the customer clicks the "View my upcoming trips" link
  Then the customer should see the "/customers/trips/new" page

Scenario: A customer adds a trip successfully
  Given a customer visits the "customer_profile" page
  When the customer clicks the "View my upcoming trips" link
  Then the customer should see the "/customers/trips/new" page
  When the customer submits valid trip information
  Then the customer should see the "/customers/trips" page
  And the trip name should be present

Scenario: A customer adds 2 trips successfully
  Given a customer visits the "customer_profile" page
  When the customer clicks the "View my upcoming trips" link
  Then the customer should see the "/customers/trips/new" page
  When the customer submits valid trip information for the second time
  Then the customer should see the "/customers/trips" page
  When the customer clicks the "Create a new Trip" link
  When the customer submits valid trip information
  Then both trip names should be present

Scenario: A customer gives invalid input when creating a trip
  Given a customer visits the "customer_profile" page
  When the customer clicks the "View my upcoming trips" link
  Then the customer should see the "/customers/trips/new" page
  When the customer submits invalid trip information
  Then they should see warnings

Scenario: A customer is not logged in and trys to access the create a trip page
  When the customer clicks the "Sign out" link
  And the customer visits the "/customers/trips" page
  Then the customer should see the "/customers/sign_in" page