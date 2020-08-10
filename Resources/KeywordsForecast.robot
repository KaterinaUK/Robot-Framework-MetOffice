*** Settings ***
Library  SeleniumLibrary
Variables  ../PageObjects/HomePageLocators.py
Variables   ../PageObjects/ForecastPageLocators.py

*** Keywords ***
Select Search Text Box
    click element   ${HPSearchTextBox}

Enter Search Term
    [arguments]  ${searchterm}
    Wait Until Page Contains Element    ${HPSearchTextBox}
    input text  ${HPSearchTextBox}  ${searchterm}

Click Search
    click element   ${HPSearchButton}

Forecast Page Should Be Open
    Wait Until Page Contains Element    ${FPRegionalForecast}
    Location Should Contain    https://www.metoffice.gov.uk/weather/forecast/gcj8q101t
    Title Should Be    Sidmouth - Jacobs Ladder (Beach) (Devon) weather - Met Office

Finish TestCase
    Close All Browsers

Validate 7 days of forecast
    click element   ${FPDay2}
    click element   ${FPDay3}
    click element   ${FPDay4}
    click element   ${FPDay5}
    click element   ${FPDay6}
    click element   ${FPDay7}

FAIL Validate 7 days of forecast
    click element   ${FPDay2}
    click element   ${FPDay3}
    click element   ${FPDay4}
    click element   ${FPDay5}
    click element   ${FPDay6}
    click element   ${FPDayFAIL}

Check for regional forecast
    [arguments]  ${region}
    Element Should Contain  ${FPRegionalForecast}   ${region}

Check for beach forecast
    Element Should Contain   ${FPBeachForecastHeader}     Beach forecast and tide times
    Element Should Contain   ${FPBeachForecastLocation}     Sidmouth - Jacobs Ladder (Beach)
    Element Should Contain   ${FPWindForecast}      Wind
    Element Should Contain   ${FPTideForecast}      Tide

Check for NO beach forecast
    Wait Until Page Contains Element    ${FPRegionalForecast}
    Page Should Not Contain     Beach forecast and tide times

browser is opened to homepage
    Wait Until Page Contains Element    ${HPSearchTextBox}
    click element   ${HPSearchTextBox}

user searches for the place named "${placename}"
    Wait Until Page Contains Element    ${HPSearchTextBox}
    input text  ${HPSearchTextBox}  ${placename}
    click element   ${HPSearchButton}