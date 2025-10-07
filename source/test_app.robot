*** Settings ***
Resource        common.robot
Library         ../helpers/get_cta_label.py

*** Keywords ***

I get the CTA Label value
    @{labels}=    get_cta_label.Get Cta Label
    
    # FOR    ${label}    IN    @{labels}
    #     Log    In App: ${label}    console=true
    # END

    RETURN    ${labels}

I go to 
    [Arguments]    ${url}
    common.Navigate to a page    ${url}

Enter credential
    [Arguments]    ${locator}    ${value}
    common.Input Text in Field    ${locator}    ${value}

Click the button
    [Arguments]    ${locator}
    common.Click an element    ${locator}

Verify new page URL contains
    [Arguments]    ${url}
    common.Validate page URL    ${url}

Verify text in page
    [Arguments]    ${expected_text}
    common.Validate text in page    ${expected_text}

The element is displayed
    [Arguments]    ${locators}
    common.Validate element displayed    ${locators}

The UI labels should be the same with the API response labels
    [Arguments]    ${UI_labels}    ${API_response_labels}
    FOR    ${UI_label}    ${API_response_label}    IN ZIP    ${UI_labels}    ${API_response_labels}
        common.Validate texts are equal    ${UI_label}    ${API_response_label}
    END

The amount displayed should be correct
    [Arguments]    ${text_container}    ${expected_text}
    common.Validate text should contain    ${text_container}    ${expected_text}

I get the 'Add to cart' value
    [Arguments]    @{visible_cards}
    @{add_to_cart_list}=    Create List
    FOR    ${element}    IN    @{visible_cards}
        ${all_text}=    Get Text    ${element}
        ${count}=    Get Count    ${all_text}    Add to cart
        IF    ${count} > 0
            # Log    From custom keyword: Add to cart    console=true
            Append To List    ${add_to_cart_list}    Add to cart
        END
    END
    
    RETURN    @{add_to_cart_list}

I get the product list
    [Arguments]    ${locator}
    @{all_cards}=    Get WebElements    ${locator}
    @{visible_cards}=    Create List
    
    FOR    ${card}    IN    @{all_cards}
        ${is_visible}=    Call Method    ${card}    is_displayed
        IF    ${is_visible} == True
            Append To List    ${visible_cards}    ${card}
        END
    END

    RETURN    ${visible_cards}

I select and add the first plan to cart
    [Arguments]    ${locators}
    common.Click an element    ${locators}

I get the text value
    [Arguments]    ${locator}
    Sleep    10s
    common.Validate element displayed    ${locator}
    ${text}=    common.Get the text in element    ${locator}
    RETURN    ${text}
    

I continue to Cart
    [Arguments]    ${locator}
    common.Validate element displayed    ${locator}
    common.Click an element              ${locator}

The Plan added on Cart and Selected Plan should be the same
    [Arguments]    ${expected_plan}    ${actual_plan}
    common.Validate texts are equal    ${expected_plan}    ${actual_plan}

