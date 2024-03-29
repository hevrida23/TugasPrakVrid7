Feature: User Module

  Background:
    Given url "https://petstore.swagger.io/v2"
    And print "--Connect petstore API--"


  Scenario: Creates list of users with given input array
    * def header =
  """
  {
  "accept": "application/json",
  "Content-Type": "application/json"
  }
  """
    * def body =
    """
    [
           {
            "id": 1234566,
            "username": "vrida",
            "firstName": "vrida",
            "lastName": "s",
            "email": "tes1@gmail.kom",
            "password": "P@ssword",
            "phone": "08940000",
            "userStatus": 0
          }
    ]
    """
    When url "https://petstore.swagger.io/v2/user/createWithList"
    And request header
    And request body
    When method post
    Then print response
    And status 200

  Scenario: Get user by user name
    When url "https://petstore.swagger.io/v2/user/vrida"
    When method get
    Then print response
    And status 200

  Scenario: Updated user
    * def header =
  """
  {
  "accept": "application/json",
  "Content-Type": "application/json"
  }
  """
    * def body =
    """
    {
  "id": 0,
  "username": "string",
  "firstName": "string",
  "lastName": "string",
  "email": "string",
  "password": "string",
  "phone": "string",
  "userStatus": 0
    }
    """
    When url "https://petstore.swagger.io/v2/user/vrida"
    And request header
    And request body
    When method put
    Then print response
    And status 200

  Scenario: Logs user into the system
    When url "https://petstore.swagger.io/v2/user/login"
    And params {username:vrida}
    And params {password:08940000}
    When method get
    Then print response
    And status 200

  Scenario: Logs out current logged in user session
    When url "https://petstore.swagger.io/v2/user/logout"
    When method get
    Then print response
    And status 200

  Scenario: Delete user
    * def header =
    """
    {
        "accept": "application/json"
    }
    """
    When url "https://petstore.swagger.io/v2/user/vrida"
    And request header
    When method delete
    Then print response
    And status 200

  Scenario: Creates list of users with given input array
    * def header =
    """
    {
        "accept": "application/json",
        "Content-Type": "application/json"
    }
    """
    * def body =
    """
    [
          {
          "id": 1234566,
          "username": "vrida",
          "firstName": "vrida",
          "lastName": "s",
          "email": "tes1@gmail.kom",
          "password": "P@ssword",
          "phone": "08940000",
          "userStatus": 0
        }
    ]
    """
    When url "https://petstore.swagger.io/v2/user/createWithArray"
    And request header
    And request body
    When method post
    Then print response
    And status 200

  Scenario: Create user
    * def header =
    """
    {
        "accept": "application/json",
        "Content-Type": "application/json"
    }
    """
    * def body =
    """
          {
            "id": 1,
            "username": "vrid1",
            "firstName": "vrid",
            "lastName": "s",
            "email": "tes@gmail.kom",
            "password": "P@ssword",
            "phone": "08940000",
            "userStatus": 1
          }
    """
    When url "https://petstore.swagger.io/v2/user"
    And request header
    And request body
    When method post
    Then print response
    And status 200