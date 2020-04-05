#!/bin/bash

## Error to warning with blink
function yellow(){
    echo -e "\033[33m\033[01m\033[05m$1\033[0m"
}

## Error
function red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}

## green to echo 
function green(){
    echo -e "\033[32m$1\033[0m"
}

## warning
function byellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}

## blue to echo 
function blue(){
    echo -e "\033[34m$1\033[0m"
}
