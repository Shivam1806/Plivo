*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  String
Library  os
Library  Collections
Resource  Variable.robot
Resource  GenericMethod.robot

*** Keywords ***
Archive Channel
    [Arguments]  ${channel_id}
    ${channel_id}=  get from list  ${channel_id}  0
    ${header}=  create dictionary  Authorization=${Token}  Content-Type=application/x-www-form-urlencoded
    ${param}=  create dictionary  channel=${channel_id}
    ${resp}=  post request  Slack_TC  ${Archive_URL}  params=${param}  headers=${header}
    ${response}=  to json  ${resp.content}
    should be equal as integers  ${resp.status_code}  200
    Tag Name validate  ${response}  ok
























