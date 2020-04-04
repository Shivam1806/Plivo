*** Settings ***
Library  RequestsLibrary
Library  SeleniumLibrary
Library  JSONLibrary
Library  String
Library  os
Library  Collections
Resource  Variable.robot

*** Keywords ***
Tag Name validate
    [Arguments]  ${jsonResponse}  ${tag}
    ${ok}=  get value from json  ${jsonResponse}  ${tag}
    ${ok}=  get from list  ${ok}  0
    should be true  ${ok}





















