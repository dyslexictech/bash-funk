#!/bin/bash
#
# Copyright (c) 2015-2017 Vegard IT GmbH, http://vegardit.com
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 
# @author Sebastian Thomschke, Vegard IT GmbH
# @author Patrick Spielmann, Vegard IT GmbH

#
# THIS FILE IS GENERATED BY BASH-FUNK GENERATOR
#
    
function -alloc-mem() {

    local arg optionWithValue params=() _help _selftest _MEMORY_IN_MB
    for arg in "$@"; do
        case $arg in
    
            --help)
                echo "Usage: ${FUNCNAME[0]} [OPTION]... MEMORY_IN_MB"
                echo 
                echo "Allocates the given amount of RAM."
                echo 
                echo "Requirements:"
                echo "  + Command 'python' must be available."
                echo 
                echo "Parameters:"
                echo -e "  \e[1mMEMORY_IN_MB\e[22m (required)"
                echo "      Amount of RAM in MB to allocate."
                echo 
                echo "Options:"
                echo -e "\e[1m    --help\e[22m "
                echo "        Prints this help."
                echo -e "\e[1m    --selftest\e[22m "
                echo "        Performs a self-test."
                echo 
                return 0
              ;;
    
            --selftest)
                echo "Testing function [${FUNCNAME[0]}]..."
                echo -e "$ \e[1m${FUNCNAME[0]} --help\e[22m"
                local regex stdout rc
                stdout=$(${FUNCNAME[0]} --help); rc=$?
                if [[ $rc != 0 ]]; then echo "--> FAILED - exit code [$rc] instead of expected [0]."; return 1; fi
                echo "--> OK"
                echo "Testing function [${FUNCNAME[0]}]...DONE"
                return 0
              ;;
    
    
    
            -*)
                echo "${FUNCNAME[0]}: invalid option: '$arg'"
                echo Type \'${FUNCNAME[0]} --help\' for usage.
                return 1
              ;;
    
            *)
                case $optionWithValue in
                    *)
                        params+=("$arg")
                esac
              ;;
        esac
    done
    unset arg optionWithValue
    
    for param in "${params[@]}"; do
        if [[ ! $_MEMORY_IN_MB ]]; then
            _MEMORY_IN_MB=$param
            continue
        fi
        echo "${FUNCNAME[0]}: too many parameters: '$param'"
        echo Type \'${FUNCNAME[0]} --help\' for usage.
        return 1
    done
    unset param params leftoverParams
    
    
    if [[ $_MEMORY_IN_MB ]]; then
        if [[ ! "$_MEMORY_IN_MB" =~ ^-?[0-9]*$ ]]; then echo "Error: Value '$_MEMORY_IN_MB' for parameter MEMORY_IN_MB is not a numeric value."; return 1; fi
        if [[ $_MEMORY_IN_MB -lt 1 ]]; then echo "Error: Value '$_MEMORY_IN_MB' for parameter MEMORY_IN_MB is too low. Must be >= 1."; return 1; fi
        true
    else
        echo "Error: Parameter MEMORY_IN_MB must be specified."; return 1
    fi
    
    if ! hash "python" &> /dev/null; then echo "Error: Required command 'python' not found on this system."; return 1; fi
    
    ######################################################

echo -n "Allocating ${_MEMORY_IN_MB} MB of memory (may take a moment)..."
python -c "
a='1'*1024*1024*${_MEMORY_IN_MB}
print 'DONE'
raw_input('Press enter to exit...')
"

}
function _-alloc-mem() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in ${COMP_WORDS[@]}; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F _${BASH_FUNK_PREFIX:-}-alloc-mem -- ${BASH_FUNK_PREFIX:-}-alloc-mem
    
function -memfree() {

    local arg optionWithValue params=() _help _selftest _MEMORY_UNIT
    for arg in "$@"; do
        case $arg in
    
            --help)
                echo "Usage: ${FUNCNAME[0]} [OPTION]... [MEMORY_UNIT]"
                echo 
                echo "Prints the free memory (in KB by default)."
                echo 
                echo "Parameters:"
                echo -e "  \e[1mMEMORY_UNIT\e[22m "
                echo "      KB, MB or GB."
                echo 
                echo "Options:"
                echo -e "\e[1m    --help\e[22m "
                echo "        Prints this help."
                echo -e "\e[1m    --selftest\e[22m "
                echo "        Performs a self-test."
                echo 
                echo "Examples:"
                echo -e "$ \e[1m${FUNCNAME[0]} \e[22m"
                echo "12560204"
                echo 
                return 0
              ;;
    
            --selftest)
                echo "Testing function [${FUNCNAME[0]}]..."
                echo -e "$ \e[1m${FUNCNAME[0]} --help\e[22m"
                local regex stdout rc
                stdout=$(${FUNCNAME[0]} --help); rc=$?
                if [[ $rc != 0 ]]; then echo "--> FAILED - exit code [$rc] instead of expected [0]."; return 1; fi
                echo "--> OK"
                echo -e "$ \e[1m${FUNCNAME[0]} \e[22m"
                stdout=$(${FUNCNAME[0]} ); rc=$?
                echo $stdout
                if [[ $rc != 0 ]]; then echo "--> FAILED - exit code [$rc] instead of expected [0]."; return 1; fi
                regex="^[1-9][0-9]*$"
                if [[ ! "$stdout" =~ $regex ]]; then echo "--> FAILED - stdout [$stdout] does not match required pattern [[1-9][0-9]*]."; return 1; fi
                echo "--> OK"
                echo "Testing function [${FUNCNAME[0]}]...DONE"
                return 0
              ;;
    
    
    
            -*)
                echo "${FUNCNAME[0]}: invalid option: '$arg'"
                echo Type \'${FUNCNAME[0]} --help\' for usage.
                return 1
              ;;
    
            *)
                case $optionWithValue in
                    *)
                        params+=("$arg")
                esac
              ;;
        esac
    done
    unset arg optionWithValue
    
    for param in "${params[@]}"; do
        if [[ ! $_MEMORY_UNIT && ${#params[@]} > 0 ]]; then
            _MEMORY_UNIT=$param
            continue
        fi
        echo "${FUNCNAME[0]}: too many parameters: '$param'"
        echo Type \'${FUNCNAME[0]} --help\' for usage.
        return 1
    done
    unset param params leftoverParams
    
    
    if [[ $_MEMORY_UNIT ]]; then
        declare -A allowed=( [KB]=1 [MB]=1 [GB]=1 )
        if [[ ! ${allowed[$_MEMORY_UNIT]} ]]; then echo "Error: Value '$_MEMORY_UNIT' for parameter MEMORY_UNIT is not one of the allowed values [KB,MB,GB]."; return 1; fi
        unset allowed
        true
    fi
    
    
    ######################################################

local totalMem=$(awk '/MemFree/ {print $2}' /proc/meminfo)
local totalMemUnit=$(awk '/MemFree/ {print $3}' /proc/meminfo)

case ${totalMemUnit} in
    [Kk][Bb])
        local memTotalKB=$totalMem
        ;;
    [Mm][Bb])
        local memTotalKB=$(( totalMem * 1024 ))
        ;;
    [Gg][Bb])
        local memTotalKB=$(( totalMem * 1024 * 1024 ))
        ;;
    *)
        echo "Error: Unsupported memory unit ${totalMemUnit} encountered."
        return 1
        ;;
esac

case ${_MEMORY_UNIT:-KB} in
    KB)
        echo $memTotalKB
        ;;
    MB)
        echo $(( memTotalKB / 1024 ))
        ;;
    GB)
        echo $(( memTotalKB / 1024 / 1024 ))
        ;;
esac

}
function _-memfree() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in ${COMP_WORDS[@]}; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F _${BASH_FUNK_PREFIX:-}-memfree -- ${BASH_FUNK_PREFIX:-}-memfree
    
function -meminfo() {

    local arg optionWithValue params=() _help _selftest
    for arg in "$@"; do
        case $arg in
    
            --help)
                echo "Usage: ${FUNCNAME[0]} [OPTION]..."
                echo 
                echo "Prints memory information from /proc/meminfo."
                echo 
                echo "Options:"
                echo -e "\e[1m    --help\e[22m "
                echo "        Prints this help."
                echo -e "\e[1m    --selftest\e[22m "
                echo "        Performs a self-test."
                echo 
                echo "Examples:"
                echo -e "$ \e[1m${FUNCNAME[0]} \e[22m"
                echo 
                echo 
                return 0
              ;;
    
            --selftest)
                echo "Testing function [${FUNCNAME[0]}]..."
                echo -e "$ \e[1m${FUNCNAME[0]} --help\e[22m"
                local regex stdout rc
                stdout=$(${FUNCNAME[0]} --help); rc=$?
                if [[ $rc != 0 ]]; then echo "--> FAILED - exit code [$rc] instead of expected [0]."; return 1; fi
                echo "--> OK"
                echo -e "$ \e[1m${FUNCNAME[0]} \e[22m"
                stdout=$(${FUNCNAME[0]} ); rc=$?
                echo $stdout
                if [[ $rc != 0 ]]; then echo "--> FAILED - exit code [$rc] instead of expected [0]."; return 1; fi
                regex="^.*MemTotal.*MemFree.*$"
                if [[ ! "$stdout" =~ $regex ]]; then echo "--> FAILED - stdout [$stdout] does not match required pattern [.*MemTotal.*MemFree.*]."; return 1; fi
                echo "--> OK"
                echo "Testing function [${FUNCNAME[0]}]...DONE"
                return 0
              ;;
    
    
    
            -*)
                echo "${FUNCNAME[0]}: invalid option: '$arg'"
                echo Type \'${FUNCNAME[0]} --help\' for usage.
                return 1
              ;;
    
            *)
                case $optionWithValue in
                    *)
                        params+=("$arg")
                esac
              ;;
        esac
    done
    unset arg optionWithValue
    
    for param in "${params[@]}"; do
        echo "${FUNCNAME[0]}: too many parameters: '$param'"
        echo Type \'${FUNCNAME[0]} --help\' for usage.
        return 1
    done
    unset param params leftoverParams
    
    
    
    
    ######################################################

cat /proc/meminfo

}
function _-meminfo() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in ${COMP_WORDS[@]}; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F _${BASH_FUNK_PREFIX:-}-meminfo -- ${BASH_FUNK_PREFIX:-}-meminfo
    
function -memtotal() {

    local arg optionWithValue params=() _help _selftest _MEMORY_UNIT
    for arg in "$@"; do
        case $arg in
    
            --help)
                echo "Usage: ${FUNCNAME[0]} [OPTION]... [MEMORY_UNIT]"
                echo 
                echo "Prints the total memory (in KB by default)."
                echo 
                echo "Parameters:"
                echo -e "  \e[1mMEMORY_UNIT\e[22m "
                echo "      KB, MB or GB."
                echo 
                echo "Options:"
                echo -e "\e[1m    --help\e[22m "
                echo "        Prints this help."
                echo -e "\e[1m    --selftest\e[22m "
                echo "        Performs a self-test."
                echo 
                echo "Examples:"
                echo -e "$ \e[1m${FUNCNAME[0]} \e[22m"
                echo "24689476"
                echo 
                return 0
              ;;
    
            --selftest)
                echo "Testing function [${FUNCNAME[0]}]..."
                echo -e "$ \e[1m${FUNCNAME[0]} --help\e[22m"
                local regex stdout rc
                stdout=$(${FUNCNAME[0]} --help); rc=$?
                if [[ $rc != 0 ]]; then echo "--> FAILED - exit code [$rc] instead of expected [0]."; return 1; fi
                echo "--> OK"
                echo -e "$ \e[1m${FUNCNAME[0]} \e[22m"
                stdout=$(${FUNCNAME[0]} ); rc=$?
                echo $stdout
                if [[ $rc != 0 ]]; then echo "--> FAILED - exit code [$rc] instead of expected [0]."; return 1; fi
                regex="^[1-9][0-9]*$"
                if [[ ! "$stdout" =~ $regex ]]; then echo "--> FAILED - stdout [$stdout] does not match required pattern [[1-9][0-9]*]."; return 1; fi
                echo "--> OK"
                echo "Testing function [${FUNCNAME[0]}]...DONE"
                return 0
              ;;
    
    
    
            -*)
                echo "${FUNCNAME[0]}: invalid option: '$arg'"
                echo Type \'${FUNCNAME[0]} --help\' for usage.
                return 1
              ;;
    
            *)
                case $optionWithValue in
                    *)
                        params+=("$arg")
                esac
              ;;
        esac
    done
    unset arg optionWithValue
    
    for param in "${params[@]}"; do
        if [[ ! $_MEMORY_UNIT && ${#params[@]} > 0 ]]; then
            _MEMORY_UNIT=$param
            continue
        fi
        echo "${FUNCNAME[0]}: too many parameters: '$param'"
        echo Type \'${FUNCNAME[0]} --help\' for usage.
        return 1
    done
    unset param params leftoverParams
    
    
    if [[ $_MEMORY_UNIT ]]; then
        declare -A allowed=( [KB]=1 [MB]=1 [GB]=1 )
        if [[ ! ${allowed[$_MEMORY_UNIT]} ]]; then echo "Error: Value '$_MEMORY_UNIT' for parameter MEMORY_UNIT is not one of the allowed values [KB,MB,GB]."; return 1; fi
        unset allowed
        true
    fi
    
    
    ######################################################

local totalMem=$(awk '/MemTotal/ {print $2}' /proc/meminfo)
local totalMemUnit=$(awk '/MemTotal/ {print $3}' /proc/meminfo)

case ${totalMemUnit} in
    [Kk][Bb])
        local memTotalKB=$totalMem
        ;;
    [Mm][Bb])
        local memTotalKB=$(( totalMem * 1024 ))
        ;;
    [Gg][Bb])
        local memTotalKB=$(( totalMem * 1024 * 1024 ))
        ;;
    *)
        echo "Error: Unsupported memory unit ${totalMemUnit} encountered."
        return 1
        ;;
esac

case ${_MEMORY_UNIT:-KB} in
    KB)
        echo $memTotalKB
        ;;
    MB)
        echo $(( memTotalKB / 1024 ))
        ;;
    GB)
        echo $(( memTotalKB / 1024 / 1024 ))
        ;;
esac

}
function _-memtotal() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in ${COMP_WORDS[@]}; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F _${BASH_FUNK_PREFIX:-}-memtotal -- ${BASH_FUNK_PREFIX:-}-memtotal
    
function -test-memory() {

    local arg optionWithValue params=() _help _selftest
    for arg in "$@"; do
        case $arg in
    
            --help)
                echo "Usage: ${FUNCNAME[0]} [OPTION]..."
                echo 
                echo "Performs a selftest of all functions of this module by executing each function with option '--selftest'."
                echo 
                echo "Options:"
                echo -e "\e[1m    --help\e[22m "
                echo "        Prints this help."
                echo -e "\e[1m    --selftest\e[22m "
                echo "        Performs a self-test."
                echo 
                return 0
              ;;
    
            --selftest)
                echo "Testing function [${FUNCNAME[0]}]..."
                echo -e "$ \e[1m${FUNCNAME[0]} --help\e[22m"
                local regex stdout rc
                stdout=$(${FUNCNAME[0]} --help); rc=$?
                if [[ $rc != 0 ]]; then echo "--> FAILED - exit code [$rc] instead of expected [0]."; return 1; fi
                echo "--> OK"
                echo "Testing function [${FUNCNAME[0]}]...DONE"
                return 0
              ;;
    
    
    
            -*)
                echo "${FUNCNAME[0]}: invalid option: '$arg'"
                echo Type \'${FUNCNAME[0]} --help\' for usage.
                return 1
              ;;
    
            *)
                case $optionWithValue in
                    *)
                        params+=("$arg")
                esac
              ;;
        esac
    done
    unset arg optionWithValue
    
    for param in "${params[@]}"; do
        echo "${FUNCNAME[0]}: too many parameters: '$param'"
        echo Type \'${FUNCNAME[0]} --help\' for usage.
        return 1
    done
    unset param params leftoverParams
    
    
    
    
    ######################################################

${BASH_FUNK_PREFIX:-}-alloc-mem --selftest && echo || return 1
${BASH_FUNK_PREFIX:-}-memfree --selftest && echo || return 1
${BASH_FUNK_PREFIX:-}-meminfo --selftest && echo || return 1
${BASH_FUNK_PREFIX:-}-memtotal --selftest && echo || return 1
}
function _-test-memory() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in ${COMP_WORDS[@]}; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F _${BASH_FUNK_PREFIX:-}-test-memory -- ${BASH_FUNK_PREFIX:-}-test-memory

function -help-memory() {

    echo -e "\e[1m${BASH_FUNK_PREFIX:-}-alloc-mem MEMORY_IN_MB\e[0m  -  Allocates the given amount of RAM."
    echo -e "\e[1m${BASH_FUNK_PREFIX:-}-memfree [MEMORY_UNIT]\e[0m  -  Prints the free memory (in KB by default)."
    echo -e "\e[1m${BASH_FUNK_PREFIX:-}-meminfo\e[0m  -  Prints memory information from /proc/meminfo."
    echo -e "\e[1m${BASH_FUNK_PREFIX:-}-memtotal [MEMORY_UNIT]\e[0m  -  Prints the total memory (in KB by default)."
    echo -e "\e[1m${BASH_FUNK_PREFIX:-}-test-memory\e[0m  -  Performs a selftest of all functions of this module by executing each function with option '--selftest'."

}

