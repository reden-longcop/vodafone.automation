*** Settings ***
Resource           ../source/test_app.robot
Resource           ../source/common.robot
Resource           ../data/variables/public_variables.robot
Variables          ../data/locators/locators.yaml
Test Setup         Main Test Setup    ${browser}
Test Teardown      Main Test Teardown

*** Comments ***
This is the login testsuite

*** Test Cases ***
Part 1: Compare UI Labels vs. API Response Labels
    [Documentation]    The UI labels should be the same with the API response labels
    [Tags]             test    P1
    GIVEN I go to                                                         ${SIM_ONLY_PAGE}
    # AND The element is displayed                                          ${SIM ONLY['main']}
    @{cards}=                  WHEN I get the product list                ${SIM ONLY['plan cards']}
    @{UI_labels}=              AND I get the 'Add to cart' value          @{cards}
    @{API_response_labels}=    AND I get the CTA Label value
    THEN The UI labels should be the same with the API response labels    ${UI_labels}    
    ...                                                                   ${API_response_labels}
    
Part 2: Add a Plan to Cart and Assert Values
    [Documentation]    Should be able to successfuly add a plan
    [Tags]             test    P2
    GIVEN I go to                                                         ${SIM_ONLY_PAGE}
    # AND The element is displayed                                          ${SIM ONLY['main']}
    Sleep    10s
    
    ${expected_plan}=    
    ...    WHEN I get the text value                                      ${SIM ONLY['first plan name']}
    ${expected_price}=    
    ...    AND I get the text value                                       ${SIM ONLY['first plan price']}
    AND I select and add the first plan to cart                           ${SIM ONLY['first plan']}
    
    Sleep    10s
    
    AND The element is displayed                                          ${STICKY CART['main']}
    ${actual_price}=    AND I get the text value                          ${STICKY CART['cart cost']}    
    THEN The amount displayed should be correct                           ${actual_price}    ${expected_price}
    
    Sleep    10s
    
    WHEN I continue to Cart                                               ${STICKY CART['continue to cart']}
    ${actual_plan}=    AND I get the text value                           ${CART PAGE['plan label']}
    THEN The Plan added on Cart and Selected Plan should be the same      ${actual_plan}    ${expected_plan}
    
    
    

    
