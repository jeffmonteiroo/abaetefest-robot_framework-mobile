*** Settings ***
Library            AppiumLibrary
Library            Collections
Library            BuiltIn
Library            String


Resource   android_resources.robot
Resource   ios_resources.robot


*** Keywords ***
Setup for Platform
    ${platform}=    Get Variable Value    ${PLATFORM}
    Run Keyword If    '${platform}' == 'android'    Setup Android
    Run Keyword If    '${platform}' == 'ios'        Setup iOS

Teardown for Platform    
    Sleep    5
    Close Application

