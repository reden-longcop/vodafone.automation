*** Settings ***
Documentation     Common keywords for the project
Library           SeleniumLibrary
Library           Collections
Library           String

*** Keywords ***
Main Test Setup
    [Arguments]    ${browser}
    Open Browser    about:blank    ${browser}
    Maximize Browser Window
    Set Screenshot Directory    logs/${browser}/screenshots

Main Test Teardown
    Capture Page Screenshot
    Close All Browsers

# common keywords
Navigate to a page
    [Arguments]    ${url}
    Go To    ${url}
    Location Should Be    ${url}

Input Text in Field
    [Arguments]    ${locator}    ${value}
    Element Should Be Visible    ${locator}
    Input Text    ${locator}    ${value}

Click an element
    [Arguments]    ${locator}
    Element Should Be Visible    ${locator}
    Click Element    ${locator}

Get the text in element
    [Arguments]    ${locator}
    ${text}=    Get Text    ${locator}
    RETURN    ${text}

Validate element displayed
    [Arguments]    ${locators}
    Wait Until Keyword Succeeds    10    1s    Element Should Be Visible    ${locators}

Validate text in element
    [Arguments]    ${locators}    ${expected_text}
    Element Should Be Visible    ${locators}
    Element Text Should Be    ${locators}    ${expected_text}

Validate text in page
    [Arguments]    ${expected_text}
    Page Should Contain    ${expected_text}

Validate element is clickable
    [Arguments]    ${locators}
    Element Should Be Enabled    ${locators}

Validate page URL
    [Arguments]    ${url}
    Location Should Be    ${url}

Validate texts are equal
    [Arguments]    ${first_text}    ${second_text}
    Should Be Equal    ${first_text}    ${second_text}

Validate text should contain
    [Arguments]    ${text_container}    ${expected_text}
    Should Contain    ${text_container}    ${expected_text}                                