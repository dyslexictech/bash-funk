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
    local opts="" opt rc __fn=${FUNCNAME[0]}
    for opt in a u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -o pipefail

    __impl$__fn "$@" && rc=0 || rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-cpu-count() {
    local __args=() __arg __idx __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
    [ -t 1 ] && __interactive=1 || true
    
    for __arg in "$@"; do
        case "$__arg" in
            -|--*) __args+=("$__arg") ;;
            -*) for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
        esac
    done
    for __arg in "${__args[@]}"; do
        case "$__arg" in

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
                local __stdout __rc
                __stdout="$($__fn --help)"; __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
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

    ######### cpu-count ######### START

grep processor /proc/cpuinfo | wc -l

    ######### cpu-count ######### END
}
function __complete-cpu-count() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}cpu-count -- ${BASH_FUNK_PREFIX:--}cpu-count

function -cpu-perf() {
    local opts="" opt rc __fn=${FUNCNAME[0]}
    for opt in a u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -o pipefail

    __impl$__fn "$@" && rc=0 || rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-cpu-perf() {
    local __args=() __arg __idx __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
    [ -t 1 ] && __interactive=1 || true
    
    for __arg in "$@"; do
        case "$__arg" in
            -|--*) __args+=("$__arg") ;;
            -*) for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
        esac
    done
    for __arg in "${__args[@]}"; do
        case "$__arg" in

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
                local __stdout __rc
                __stdout="$($__fn --help)"; __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
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

    ######### cpu-perf ######### START

openssl speed rsa1024 -multi $(cat /proc/cpuinfo | grep processor | wc -l)

    ######### cpu-perf ######### END
}
function __complete-cpu-perf() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}cpu-perf -- ${BASH_FUNK_PREFIX:--}cpu-perf

function -scp-perf() {
    local opts="" opt rc __fn=${FUNCNAME[0]}
    for opt in a u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -o pipefail

    __impl$__fn "$@" && rc=0 || rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]... TARGET [SIZE_MB]"
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-scp-perf() {
    local __args=() __arg __idx __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _port _identity_file _help _selftest _TARGET _SIZE_MB
    [ -t 1 ] && __interactive=1 || true
    
    for __arg in "$@"; do
        case "$__arg" in
            -|--*) __args+=("$__arg") ;;
            -*) for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
        esac
    done
    for __arg in "${__args[@]}"; do
        case "$__arg" in

            --help)
                echo "Usage: $__fn [OPTION]... TARGET [SIZE_MB]"
                echo
                echo "Performs an SCP speed test."
                echo
                echo "Parameters:"
                echo -e "  \033[1mTARGET\033[22m (required)"
                echo "      [user@:]hostname."
                echo -e "  \033[1mSIZE_MB\033[22m (default: '10', integer: ?-?)"
                echo "      Test file size in MB."
                echo
                echo "Options:"
                echo -e "\033[1m-i, --identity_file PATH\033[22m (file)"
                echo "        Path to the private key for public key authentication."
                echo -e "\033[1m-P, --port PORT\033[22m (integer: 0-65535)"
                echo "        Ssh port."
                echo "    -----------------------------"
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
                local __stdout __rc
                __stdout="$($__fn --help)"; __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;

            --port|-P)
                _port="@@##@@"
                __optionWithValue=port
            ;;

            --identity_file|-i)
                _identity_file="@@##@@"
                __optionWithValue=identity_file
            ;;

            -*)
                echo "$__fn: invalid option: '$__arg'"
                return 64
              ;;

            *)
                case $__optionWithValue in
                    port)
                        _port=$__arg
                        __optionWithValue=
                      ;;
                    identity_file)
                        _identity_file=$__arg
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

    if [[ ! $_SIZE_MB ]]; then _SIZE_MB="10"; fi
    if [[ $_port ]]; then
        if [[ $_port == "@@##@@" ]]; then echo "$__fn: Error: Value PORT for option --port must be specified."; return 64; fi
        if [[ ! "$_port" =~ ^-?[0-9]*$ ]]; then echo "$__fn: Error: Value '$_port' for option --port is not a numeric value."; return 64; fi
        if [[ $_port -lt 0 ]]; then echo "$__fn: Error: Value '$_port' for option --port is too low. Must be >= 0."; return 64; fi
        if [[ $_port -gt 65535 ]]; then echo "$__fn: Error: Value '$_port' for option --port is too high. Must be <= 65535."; return 64; fi
    fi
    if [[ $_identity_file ]]; then
        if [[ $_identity_file == "@@##@@" ]]; then echo "$__fn: Error: Value PATH for option --identity_file must be specified."; return 64; fi
        if [[ ! -e "$_identity_file" ]]; then echo "$__fn: Error: File '$_identity_file' for option --identity_file does not exist."; return 64; fi
        if [[ -e "$_identity_file" && ! -f "$_identity_file" ]]; then echo "$__fn: Error: Path '$_identity_file' for option --identity_file is not a file."; return 64; fi
        if [[ ! -r "$_identity_file" ]]; then echo "$__fn: Error: File '$_identity_file' for option --identity_file is not readable by user '$USER'."; return 64; fi
    fi

    if [[ $_TARGET ]]; then
        true
    else
        echo "$__fn: Error: Parameter TARGET must be specified."; return 64
    fi
    if [[ $_SIZE_MB ]]; then
        if [[ ! "$_SIZE_MB" =~ ^-?[0-9]*$ ]]; then echo "$__fn: Error: Value '$_SIZE_MB' for parameter SIZE_MB is not a numeric value."; return 64; fi
    fi

    ######### scp-perf ######### START

local dataFile=$(mktemp)

local sshOpts=""
if [[ ${_port} ]]; then
    sshOpts="$sshOpts -P $_port"
fi
if [[ ${_identity_file} ]]; then
    sshOpts="$sshOpts -i $_identity_file"
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

    ######### scp-perf ######### END
}
function __complete-scp-perf() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --port -P --identity_file -i --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}scp-perf -- ${BASH_FUNK_PREFIX:--}scp-perf

function -test-performance() {
    local opts="" opt rc __fn=${FUNCNAME[0]}
    for opt in a u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -o pipefail

    __impl$__fn "$@" && rc=0 || rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-test-performance() {
    local __args=() __arg __idx __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
    [ -t 1 ] && __interactive=1 || true
    
    for __arg in "$@"; do
        case "$__arg" in
            -|--*) __args+=("$__arg") ;;
            -*) for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
        esac
    done
    for __arg in "${__args[@]}"; do
        case "$__arg" in

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
                local __stdout __rc
                __stdout="$($__fn --help)"; __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
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

    ######### test-performance ######### START

${BASH_FUNK_PREFIX:--}cpu-count --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}cpu-perf --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}scp-perf --selftest && echo || return 1

    ######### test-performance ######### END
}
function __complete-test-performance() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
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
