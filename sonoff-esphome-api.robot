*** Keywords ***
Sonoff Esphome Power On
    [Documentation]    Keyword prepares and sends Post Request for turning on Sonoff.
    ${response}=    RequestsLibrary.POST On Session   SonoffCtrl    switch/sonoff_s20_relay/turn_on
    Should Be Equal As Integers    ${response.status_code}    200

Sonoff Esphome Power Off
    [Documentation]    Keyword prepares and sends Post Request for turning off Sonoff.
    ${response}=    RequestsLibrary.POST On Session    SonoffCtrl    switch/sonoff_s20_relay/turn_off
    Should Be Equal As Integers    ${response.status_code}    200

Sonoff Esphome Toggle
    [Documentation]    Keyword prepares and sends Post Request for toggling Sonoff.
    ${response}=    RequestsLibrary.POST On Session    SonoffCtrl    switch/sonoff_s20_relay/toggle
    Should Be Equal As Integers    ${response.status_code}    200

Get Sonoff Esphome State
    [Documentation]    Keyword returns the current state of Sonoff switch.
    ${state}=    RequestsLibrary.GET On Session    SonoffCtrl    switch/sonoff_s20_relay
    ${sonoff_state}=    Set Variable If
    ...    '${state.json()["state"]}' == 'ON'    high
    ...    '${state.json()["state"]}' == 'OFF'    low
    [Return]    ${sonoff_state}

Sonoff Esphome API Setup
    [Documentation]    Keyword creates HTTP sesion with the requested Sonoff.
    ...    Takes as an argument the Sonoff IP.
    [Arguments]    ${sonoff_ip}
    ${headers}=    Create Dictionary    Content-Type=application/json    Accept=application/json
    RequestsLibrary.Create Session    SonoffCtrl    http://${sonoff_ip}    verify=True    headers=${headers}
