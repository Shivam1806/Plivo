*** Settings ***
Library  RequestsLibrary
Library  SeleniumLibrary
Library  JSONLibrary
Library  String
Library  os
Library  Collections
Resource  Variable.robot
Resource  GenericMethod.robot

*** Keywords ***
Get List of All Channels
    ${header}=  create dictionary  Authorization=${Token}  Content-Type=application/x-www-form-urlencoded
    ${getlistresp}=  get request  Slack_TC  ${List_URL}  headers=${header}
    ${resp}=  to json  ${getlistresp.content}
    should be equal as integers  ${getlistresp.status_code}  200
    Tag Name validate  ${resp}  ok
    [Return]  ${resp}


Get All Channel Details
    [Arguments]  ${tagName}
    ${getlist}=  Get List of All Channels
    ${channeldtl_Lists}=  create list
    ${channelDts}=  get value from json  ${getlist}  channels
    ${channelDts}=  get from list  ${channelDts}  0
    ${channel_length}=  get length  ${channelDts}
    : FOR  ${i}  IN RANGE  ${channel_length}
    \   ${name}=  get value from json  ${channelDts}[${i}]  name
    \   ${name}=  get from list  ${name}  0
    \   ${id}=  run keyword if  '${name}'!='general'  get value from json   ${channelDts}[${i}]  ${tagName}
    \   run keyword if  '${name}'!='general'  append to list  ${channeldtl_Lists}  ${id}
    [Return]  ${channeldtl_Lists}

Check NewName in List
    [Arguments]  ${NewName}
    ${channel_list}=  Get All Channel Details  name
    ${channel_list}=  get from list  ${channel_list}  0
    ${channel_list}=  get from list  ${channel_list}  0
    ${NewName}=  Convert to lowercase  ${NewName}
    should be true  '${NewName}'=='${channel_list}'

Check Archive Status of Channel
    ${status}=  Get All Channel Details  is_archived
    ${status}=  get from list  ${status}  0
    ${status}=  get from list  ${status}  0
    should be true  ${status}




















