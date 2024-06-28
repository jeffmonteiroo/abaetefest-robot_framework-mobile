*** Settings ***

*** Variables ***
${APP_URL}                      https://app.abaetefest.com.br/
${PLATFORM_NAME}                iOS
${PLATFORM_VERSION}             17.5
${DEVICE_NAME}                  iPad Pro 11-inch (M4)
${AUTOMATION_NAME}              XCUITest
${BROWSER_NAME}                 Safari
${INCLUDE_SAFARI_IN_WEBVIEWS}   true
${NEW_COMMAND_TIMEOUT}          3600
${CONNECT_HARDWARE_KEYBOARD}    true
#${id-device}                   35DAA68E-1336-4683-A100-35CA2AD6A56B

*** Keywords ***
Setup iOS
   Open Application    http://localhost:4723   
   ...                 platformName=${PLATFORM_NAME}   
   ...                 platformVersion=${PLATFORM_VERSION}       
   ...                 deviceName=${DEVICE_NAME}   
   ...                 automationName=${AUTOMATION_NAME}  
   ...                 browserName=${BROWSER_NAME}  
 #  ...                 udid=${id-device}
  # ...                 includeSafariInWebviews=${INCLUDE_SAFARI_IN_WEBVIEWS}   
  # ...                 newCommandTimeout=${NEW_COMMAND_TIMEOUT}  
  # ...                 connectHardwareKeyboard=${CONNECT_HARDWARE_KEYBOARD}
    Go To URL         ${APP_URL}
    Wait Until Page Contains    AbaetéFest    timeout=30s

