*** Keywords ***
Sonoff Power On
    [Documentation]    Keyword prepares and sends Post Request for turning on Sonoff.
    ${response}=    RequestsLibrary.POST On Session   SonoffCtrl    url=/cm    params=cmnd=Power%20On
    Should Be Equal As Integers    ${response.status_code}    200

Sonoff Power Off
    [Documentation]    Keyword prepares and sends Post Request for turning off Sonoff.
    ${response}=    RequestsLibrary.POST On Session    SonoffCtrl    url=/cm    params=cmnd=Power%20Off
    Should Be Equal As Integers    ${response.status_code}    200

Sonoff Toggle
    [Documentation]    Keyword prepares and sends Post Request for toggling Sonoff.
    ${response}=    RequestsLibrary.POST On Session    SonoffCtrl    url=/cm    params=cmnd=Power%20TOGGLE
    Should Be Equal As Integers    ${response.status_code}    200

Get Sonoff State
    [Documentation]    Keyword returns the current state of Sonoff switch.
    ${state}=    RequestsLibrary.GET On Session    SonoffCtrl    url=/cm    params=cmnd=Power
    ${sonoff_state}=    Set Variable If
    ...    '${state.json()["POWER"]}' == 'ON'    high
    ...    '${state.json()["POWER"]}' == 'OFF'    low
    [Return]    ${sonoff_state}

Sonoff API Setup
    [Documentation]    Keyword creates HTTP sesion with the requested Sonoff.
    ...    Takes as an argument the Sonoff IP.
    [Arguments]    ${sonoff_ip}
    ${headers}=    Create Dictionary    Content-Type=application/json    Accept=application/json
    RequestsLibrary.Create Session    SonoffCtrl    http://${sonoff_ip}    verify=True    headers=${headers}
