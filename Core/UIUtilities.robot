*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Utilities.Scroll to Element
    [Documentation]     Pass in a recognizable element selector; this keyword
    ...                 will scroll the pane to make it the top-most element.
    ...                 Optionally, change the ``vert_offset`` to another value
    ...                 to control how far "back" you want to scroll from the
    ...                 element (allows you to see elements above the element).
    [Arguments]             ${the_element}  ${vert_offset}=50.0
    Wait Until Page Contains Element   ${the_element}     timeout=5 seconds    error=*HTML* <span style="color:red;font-weight:bold">φ</span> Scroll to Element:: unable to locate the element '${the_element}'
    ${vert_pos} =           Get Vertical Position       ${the_element}
    ${horz_pos} =           Get Horizontal Position     ${the_element}
    ${vert_pos} =    evaluate    ${vert_pos} - ${vert_offset}
    Execute JavaScript      window.scrollTo(${horz_pos},${vert_pos})
    Sleep                   .25 seconds