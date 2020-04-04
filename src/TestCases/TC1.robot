*** Settings ***
Documentation    Suite description
Documentation    Plivo Test Suite
Library  RequestsLibrary
Library  Collections
Library  os
Library  SeleniumLibrary
Resource  ../Resources/Variable.robot
Resource  ../Resources/GetList.robot
Resource  ../Resources/DeleteChannels.robot
Resource  ../Resources/CreateChannel.robot
Resource  ../Resources/RenameChannel.robot
Resource  ../Resources/ArchiveChannel.robot
Resource  ../Resources/JoinChannel.robot
Library  DataDriver  ../TestResources/Channels.csv
Suite Setup  create session  Slack_TC   ${Base_URL}
Test Template  Slack Process Step by Step

*** Test Cases ***
TestCase_with_ChannelName using ${Channels}

*** Keywords ***
Slack Process Step by Step
    [Arguments]  ${Channels}  ${NewName}
    ${channel_ids}=  Get All Channel Details  id
    Delete Existing Channels  ${channel_ids}
    ${id}=  Create New Channel  ${Channels}
    Join New Channel  ${id}
    Rename Channel with New Name  ${id}  ${NewName}
    Check NewName in List  ${NewName}
    ${new_id}=  Get All Channel Details  id
    ${new_id}=  get from list  ${new_id}  0
    Archive Channel  ${new_id}
    Check Archive Status of Channel









