*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Resource  ../Resources/KeywordsForecast.robot
Resource  ../Resources/Common.robot
Test Setup          Start TestCase
Test Teardown       Finish TestCase

*** Variables ***
${searchterm}   jacobs ladder
${placename}    jacobs ladder
${searchterm2}   Sidmouth
${enterregionname}  South West England

*** Test Cases ***

TC1: I can find the forecast for Jacobs Ladder beach in Sidmouth and be taken to the appropriate forecast page
    [Tags]  Functional Tests - Forecast
    Select Search Text Box
    Enter Search Term   ${searchterm}
    Click Search
    Forecast Page Should Be Open  #validates page URl and page title

TC2: 7 days of forecasts should be shown on the forecast page
    [Tags]  Functional Tests - Forecast
    Select Search Text Box
    Enter Search Term   ${searchterm}
    Click Search
    Validate 7 days of forecast   #validates that 6 remaining days forecast tabs are clickable

TC3: There should be a forecast for South West England on the forecast page
    [Tags]  Functional Tests - Forecast
    Select Search Text Box
    Enter Search Term   ${searchterm}
    Click Search
    Check for regional forecast     ${enterregionname}   #Validates region name on element

TC4: There should be a beach forecast available for Jacobs Ladder
    [Tags]  Functional Tests - Forecast
    Select Search Text Box
    Enter Search Term   ${searchterm}
    Click Search
    Check for beach forecast    #validates beach forecast is on the page, that it is for the correct beach, and that Wind and Tide are present

TC5: There should not be a beach forecast for Sidmouth
    [Tags]  Functional Tests - Forecast
    Select Search Text Box
    Enter Search Term   ${searchterm2}
    Click Search
    Check for NO beach forecast     #validates that no beach forecast is present on the page

TC6: GHERKIN - I can find the forecast for Jacobs Ladder beach in Sidmouth and be taken to the appropriate forecast page
    [Tags]  Demo - Gherkin Syntax
    Given browser is opened to homepage
    When user searches for the place named "${placename}"
    Then forecast page should be open

TC7: THIS TEST CASE WILL FAIL - 7 days of forecasts should be shown on the forecast page
#this has been setup to fail, to demonstrate the screenshot capture feature of robot framework
    [Tags]  Demo - Failed Test
    Select Search Text Box
    Enter Search Term   ${searchterm}
    Click Search
    FAIL Validate 7 days of forecast