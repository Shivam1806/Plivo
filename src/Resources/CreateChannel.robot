*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  String
Library  os
Library  Collections
Resource  Variable.robot
Resource  GenericMethod.robot

*** Keywords ***
Create New Channel
    [Arguments]  ${Channels}
    ${header}=  create dictionary  Authorization=${Token}  Content-Type=application/x-www-form-urlencoded
    ${param}=  create dictionary  name=${Channels}
    ${resp}=  post request  Slack_TC  ${Create_URL}  params=${param}  headers=${header}
    ${response}=  to json  ${resp.content}
    should be equal as integers  ${resp.status_code}  200
    Tag Name validate  ${response}  ok
    ${id}=   get value from json  ${response}  channel.id
    ${id}=  get from list  ${id}  0
    [Return]  ${id}

























