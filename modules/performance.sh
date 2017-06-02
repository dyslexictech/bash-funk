#!/usr/bin/env bash
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
function -cpu-count() {
    local opts=""
    local opt
    for opt in a e u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -e
    set -o pipefail

    local __fn=${FUNCNAME[0]}
    __impl$__fn "$@" && local rc=0 || local rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-cpu-count() {
    [ -p /dev/stdout ] && __in_pipe=1 || true
    [ -t 1 ] || __in_subshell=1
    local __arg __optionWithValue __params=() __fn=${FUNCNAME[0]/__impl/} _help _selftest
    for __arg in "$@"; do
        case $__arg in

            --help)
                echo "Usage: $__fn [OPTION]..."
                echo
                echo "Prints the number of processors."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                __stdout=$($__fn --help); __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> [32mOK[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;



            -*)
                echo "$__fn: invalid option: '$__arg'"
                return 64
              ;;

            *)
                case $__optionWithValue in
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done




    ######################################################
grep processor /proc/cpuinfo | wc -l
}
function __complete-cpu-count() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}cpu-count -- ${BASH_FUNK_PREFIX:--}cpu-count

function -cpu-perf() {
    local opts=""
    local opt
    for opt in a e u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -e
    set -o pipefail

    local __fn=${FUNCNAME[0]}
    __impl$__fn "$@" && local rc=0 || local rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-cpu-perf() {
    [ -p /dev/stdout ] && __in_pipe=1 || true
    [ -t 1 ] || __in_subshell=1
    local __arg __optionWithValue __params=() __fn=${FUNCNAME[0]/__impl/} _help _selftest
    for __arg in "$@"; do
        case $__arg in

            --help)
                echo "Usage: $__fn [OPTION]..."
                echo
                echo "Performs a CPU speed test using openssl utilizing all available processors."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                __stdout=$($__fn --help); __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> [32mOK[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;



            -*)
                echo "$__fn: invalid option: '$__arg'"
                return 64
              ;;

            *)
                case $__optionWithValue in
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done




    ######################################################
openssl speed rsa1024 -multi $(cat /proc/cpuinfo | grep processor | wc -l)
}
function __complete-cpu-perf() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}cpu-perf -- ${BASH_FUNK_PREFIX:--}cpu-perf

function -scp-perf() {
    local opts=""
    local opt
    for opt in a e u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -e
    set -o pipefail

    local __fn=${FUNCNAME[0]}
    __impl$__fn "$@" && local rc=0 || local rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]... TARGET [SIZE_MB]"
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-scp-perf() {
    [ -p /dev/stdout ] && __in_pipe=1 || true
    [ -t 1 ] || __in_subshell=1
    local __arg __optionWithValue __params=() __fn=${FUNCNAME[0]/__impl/} _port _port_value _identity_file _identity_file_value _help _selftest _TARGET _SIZE_MB
    for __arg in "$@"; do
        case $__arg in

            --help)
                echo "Usage: $__fn [OPTION]... TARGET [SIZE_MB]"
                echo
                echo "Performs an SCP speed test."
                echo
                echo "Parameters:"
                echo -e "  \033[1mTARGET\033[22m (required)"
                echo "      [user@:]hostname."
                echo -e "  \033[1mSIZE_MB\033[22m (integer: ?-?)"
                echo "      Test file size in MB. Default is 10MB."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m-i, --identity_file PATH\033[22m "
                echo "        Path to the private key for public key authentication."
                echo -e "\033[1m-P, --port PORT\033[22m (integer: 0-65535)"
                echo "        Ssh port."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                __stdout=$($__fn --help); __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> [32mOK[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;

            --port|-P)
                _port=true
                _port_value=
                __optionWithValue=--port
            ;;

            --identity_file|-i)
                _identity_file=true
                _identity_file_value=
                __optionWithValue=--identity_file
            ;;



            -*)
                echo "$__fn: invalid option: '$__arg'"
                return 64
              ;;

            *)
                case $__optionWithValue in
                    --port)
                        _port_value=$__arg
                        __optionWithValue=
                      ;;
                    --identity_file)
                        _identity_file_value=$__arg
                        __optionWithValue=
                      ;;
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        if [[ ! $_TARGET ]]; then
            _TARGET=$__param
            continue
        fi
        if [[ ! $_SIZE_MB ]]; then
            _SIZE_MB=$__param
            continue
        fi
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done

    if [[ $_port ]]; then
        if [[ ! $_port_value ]]; then echo "$__fn: Error: Value PORT for option --port must be specified."; return 64; fi
        if [[ ! "$_port_value" =~ ^-?[0-9]*$ ]]; then echo "$__fn: Error: Value '$_port_value' for option --port is not a numeric value."; return 64; fi
        if [[ $_port_value -lt 0 ]]; then echo "$__fn: Error: Value '$_port_value' for option --port is too low. Must be >= 0."; return 64; fi
        if [[ $_port_value -gt 65535 ]]; then echo "$__fn: Error: Value '$_port_value' for option --port is too high. Must be <= 65535."; return 64; fi
        true
    fi
    if [[ $_identity_file ]]; then
        if [[ ! $_identity_file_value ]]; then echo "$__fn: Error: Value PATH for option --identity_file must be specified."; return 64; fi
        true
    fi

    if [[ $_TARGET ]]; then
        true
    else
        echo "$__fn: Error: Parameter TARGET must be specified."; return 64
    fi
    if [[ $_SIZE_MB ]]; then
        if [[ ! "$_SIZE_MB" =~ ^-?[0-9]*$ ]]; then echo "$__fn: Error: Value '$_SIZE_MB' for parameter SIZE_MB is not a numeric value."; return 64; fi
        true
    fi


    ######################################################
local dataFile=$(mktemp)

local sshOpts=""
if [[ ${_port} ]]; then
    sshOpts="$sshOpts -P $_port_value"
fi
if [[ ${_identity_file} ]]; then
    sshOpts="$sshOpts -i $_identity_file_value"
fi

local _SIZE_MB=${_SIZE_MB:-10}

echo "Generating $_SIZE_MB MB of random data..."
dd if=/dev/urandom bs=1M count=$_SIZE_MB of=$dataFile conv=notrunc

echo
echo "Uploading $_SIZE_MB MB to $_TARGET..."
scp $sshOpts "$dataFile" "$_TARGET:${dataFile}-copy"

echo
echo "Downloading $_SIZE_MB MB from $_TARGET..."
scp $sshOpts "$_TARGET:${dataFile}-copy" "$dataFile"

echo
echo "Removing test data on $_TARGET..."
ssh $sshOpts "$_TARGET" "rm ${dataFile}-copy"
echo "Removing local test data..."
rm $dataFile
}
function __complete-scp-perf() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --port -P --identity_file -i --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}scp-perf -- ${BASH_FUNK_PREFIX:--}scp-perf

function -test-performance() {
    local opts=""
    local opt
    for opt in a e u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -e
    set -o pipefail

    local __fn=${FUNCNAME[0]}
    __impl$__fn "$@" && local rc=0 || local rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-test-performance() {
    [ -p /dev/stdout ] && __in_pipe=1 || true
    [ -t 1 ] || __in_subshell=1
    local __arg __optionWithValue __params=() __fn=${FUNCNAME[0]/__impl/} _help _selftest
    for __arg in "$@"; do
        case $__arg in

            --help)
                echo "Usage: $__fn [OPTION]..."
                echo
                echo "Performs a selftest of all functions of this module by executing each function with option '--selftest'."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                __stdout=$($__fn --help); __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> [32mOK[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;



            -*)
                echo "$__fn: invalid option: '$__arg'"
                return 64
              ;;

            *)
                case $__optionWithValue in
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done




    ######################################################
${BASH_FUNK_PREFIX:--}cpu-count --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}cpu-perf --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}scp-perf --selftest && echo || return 1
}
function __complete-test-performance() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}test-performance -- ${BASH_FUNK_PREFIX:--}test-performance


function -help-performance() {
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}cpu-count\033[0m  -  Prints the number of processors."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}cpu-perf\033[0m  -  Performs a CPU speed test using openssl utilizing all available processors."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}scp-perf TARGET [SIZE_MB]\033[0m  -  Performs an SCP speed test."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}test-performance\033[0m  -  Performs a selftest of all functions of this module by executing each function with option '--selftest'."

}
__BASH_FUNK_FUNCS+=( cpu-count cpu-perf scp-perf test-performance )
