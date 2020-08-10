*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Start TestCase
    Open Browser    https://www.metoffice.gov.uk/      chrome
    Maximize Browser Window
    click button   ${HPCookiesDisclaimerBtn}