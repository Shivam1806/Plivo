*** Settings ***
Library  RequestsLibrary
Library  SeleniumLibrary
Library  String
Library  os
Library  Collections
Resource  Variable.robot
Resource  GenericMethod.robot

*** Keywords ***
Join New Channel
    [Arguments]  ${channel}
    ${header}=  create dictionary  Authorization=${Token}  Content-Type=application/x-www-form-urlencoded
    ${param}=  create dictionary  channel=${channel}
    ${resp}=  post request  Slack_TC  ${Join_URL}  params=${param}  headers=${header}
    ${response}=  to json  ${resp.content}
    Tag Name validate  ${response}  ok
    Tag Name validate  ${response}  already_in_channel
    should be equal as integers  ${resp.status_code}  200






















