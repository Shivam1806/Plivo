*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  String
Library  os
Library  Collections
Resource  Variable.robot
Resource  GenericMethod.robot

*** Keywords ***
Rename Channel with New Name
    [Arguments]  ${channel_id}  ${NewName}
    ${header}=  create dictionary  Authorization=${Token}  Content-Type=application/x-www-form-urlencoded
    ${param}=  create dictionary  channel=${channel_id}  name=${NewName}
    ${resp}=  post request  Slack_TC  ${Rename_URL}  params=${param}  headers=${header}
    ${response}=  to json  ${resp.content}
    should be equal as integers  ${resp.status_code}  200
    Tag Name validate  ${response}  ok
























