*** Settings ***
Documentation        Login
Resource             ../base.robot
Resource             ../HomePage/homePage.robot
Variables            login-page-locators.yaml
Library    AppiumLibrary

*** Keywords ***
Input Username
    [Arguments]                          ${username}
    Wait Until Element Is Visible        locator=${username_input}
    Input Text                           locator=${username_input}         text=${username}

Input User Password
    [Arguments]                          ${password}
    Input Text                           locator=${password_input}         text=${password}

Click Sign In Button On Login Screen
    Wait Until Element Is Visible        locator=${signin_element}
    Click Element                        locator=${signin_element}

Login With Valid Credential
    [Arguments]                          ${username}   ${password}
    Verify Home Screen Appears
    Click Sign In Button On Home Screen
    Input Username                       username=${username}
    Input User Password                  password=${password}
    Click Sign In Button On Login Screen
    Verify Success Login

Login With Invalid Credential
    [Arguments]                          ${username}   ${password}
    Verify Home Screen Appears
    Click Sign In Button On Home Screen
    Input Username                       username=${username}
    Input User Password                  password=${password}
    Click Sign In Button On Login Screen
    Verify Failed Login
