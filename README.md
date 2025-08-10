# -RailBalanceTrap

RailBalanceTrap — Drosera Trap SERGEANT

## Objective

Create a functional and deployable Drosera trap that:
- Monitors ETH balance anomalies of a specific wallet,
- Uses the standard collect() / shouldRespond() interface,
- Triggers a response when balance deviation exceeds a given threshold (e.g., 1%),
- Integrates with a separate alert contract to handle responses.

## Problem

Ethereum wallets involved in DAO treasury, DeFi protocol management, or vesting operations must maintain a consistent balance. Any unexpected change — loss or gain — could indicate compromise, human error, or exploit.

Solution: Monitor ETH balance of a wallet across blocks. Trigger a response if there's a significant deviation in either direction.

## Trap Logic Summary

See `RailBalanceTrap.sol` for code details (target address and threshold settings).

## Response Contract: LogAlertReceiver.sol

See `LogAlertReceiver.sol` for implementation.

## What It Solves

- Detects suspicious ETH flows from monitored addresses.
- Provides an automated alerting mechanism.
- Can integrate with automation logic (e.g., freezing funds, emergency DAO alerts).

## Deployment & Setup Instructions

1. **Deploy Contracts (e.g., via Foundry)**

   ```bash
   forge create src/RailBalanceTrap.sol:RailBalanceTrap \
     --rpc-url https://ethereum-hoodi-rpc.publicnode.com \
     --private-key 0x...

   forge create src/LogAlertReceiver.sol:LogAlertReceiver \
     --rpc-url https://ethereum-hoodi-rpc.publicnode.com \
     --private-key 0x...
   



