#!/bin/bash
set -e

if [ "$1" = 'idchain' ]; then

    # Need to init node?
    if [ ! -f /idchain/geth ]; then
        # initialize idchain
        geth --datadir /idchain init idchain-genesis.json
    fi

    exec geth --datadir /idchain --networkid 74 --rpc --rpcaddr 0.0.0.0 --rpccorsdomain "*" --rpcvhosts "*" --ws --wsorigins "*" --wsaddr 0.0.0.0 --syncmode fast --nousb
fi

exec "$@"