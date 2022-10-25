*** Keywords ***
Sonoff Power On
    [Documentation]    Keyword prepares and sends Post Request for turning on
    ...    Sonoff. Takes as an argument session handler.
    [Arguments]    ${session_handler}
    ${headers}=    Create Dictionary    Content-Type=application/json    Accept=application/json
    ${response}=    RequestsLibrary.Post Request   ${session_handler}    switch/sonoff_s20_relay/turn_on    ${headers}
    Should Be Equal As Integers    ${response.status_code}    200

Sonoff Power Off
    [Documentation]    Keyword prepares and sends Post Request for turning off
    ...    Sonoff. Takes as an argument session handler.
    [Arguments]    ${session_handler}
    ${headers}=    Create Dictionary    Content-Type=application/json    Accept=application/json
    ${response}=    RequestsLibrary.Post Request    ${session_handler}    switch/sonoff_s20_relay/turn_off    ${headers}
    Should Be Equal As Integers    ${response.status_code}    200

Sonoff Toggle
    [Documentation]    Keyword prepares and sends Post Request for toggling
    ...    Sonoff. Takes as an argument session handler.
    [Arguments]    ${session_handler}
    ${headers}=    Create Dictionary    Content-Type=application/json    Accept=application/json
    ${response}=    RequestsLibrary.Post Request    ${session_handler}    switch/sonoff_s20_relay/toggle    ${headers}
    Should Be Equal As Integers    ${response.status_code}    200

Sonoff Get State
    [Documentation]    Keyword returns the current state of Sonoff switch.
    ...    Takes as an argument session handler.
    [Arguments]    ${session_handler}
    ${headers}=    Create Dictionary    Content-Type=application/json    Accept=application/json
    ${state}=    RequestsLibrary.Get Request    ${session_handler}    switch/sonoff_s20_relay    ${headers}
    [Return]    ${state.json()["state"]}

Sonoff API Setup
    [Documentation]    Keyword creates HTTP sesion with the requested Sonoff.
    ...    Takes as an argument session handler and Sonoff IP.
    [Arguments]    ${session_handler}    ${sonoff_ip}
    RequestsLibrary.Create Session    ${session_handler}    http://${sonoff_ip}    verify=True
