*** Settings ***
Library  RequestsLibrary
Library  SeleniumLibrary
Library  JSONLibrary
Library  String
Library  os
Library  Collections
Resource  Variable.robot

*** Keywords ***
Delete Existing Channels
    [Arguments]  ${channel_ids}
    ${header}=  create dictionary  Authorization=${Token}  Content-Type=application/x-www-form-urlencoded
    ${len}=  get length  ${channel_ids}
    : FOR  ${i}  IN RANGE  ${len}
    \   ${param}=  create dictionary  channel=${channel_ids}[${i}][0]
    \   ${name}=  get value from json   ${channel_ids}[${i}]  name
    \   ${resp}=  run keyword if  '${name}'!= 'general'  post request  Slack_TC  ${Delete_URL}  params=${param}  headers=${header}
    \   ${resp}=  to json  ${resp.content}






















