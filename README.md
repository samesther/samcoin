# Samcoin

Samcoin is a simple fungible token implemented as a Clarity smart contract and managed with [Clarinet](https://docs.hiro.so/clarinet).

## Project Layout

- `LICENSE` – Project license
- `README.md` – Project documentation (this file)
- `Clarinet.toml` – Clarinet project configuration
- `contracts/` – Clarity smart contracts
  - `samcoin.clar` – Samcoin fungible token contract
- `settings/` – Reserved for Clarinet settings (network configuration)
- `tests/` – Tests for your contracts (currently empty)

## Requirements

- Clarinet CLI (already installed)

Verify Clarinet is available:

```bash
clarinet --version
```

## Samcoin Contract Overview

The `contracts/samcoin.clar` contract defines a fungible token named **Samcoin**.

### Key Components

- `define-fungible-token samcoin` – Declares the Samcoin token
- `contract-owner` – Data variable storing the principal that deployed the contract
- Public functions:
  - `transfer (amount uint) (recipient principal)` – Transfer Samcoin from the caller to `recipient`
  - `mint (amount uint) (recipient principal)` – Mint new Samcoin to `recipient` (only callable by `contract-owner`)
- Read-only functions:
  - `get-owner` – Returns the current `contract-owner`
  - `get-balance (who principal)` – Returns the Samcoin balance of `who`
  - `get-total-supply` – Returns the total supply of Samcoin

### Authorization Rules

- Only `contract-owner` can call `mint` successfully.
- Any principal can call `transfer` to move their own Samcoin to another principal, assuming sufficient balance.

## Common Commands

Run these commands from the project root directory:

```bash
cd /home/anthony/Documents/GitHub/samcoin
```

### Check Contracts

Validate the syntax and basic correctness of all contracts:

```bash
clarinet check
```

### Open Clarinet Console

Interactively experiment with the contract in a REPL-like environment:

```bash
clarinet console
```

From the console you can call read-only functions (e.g. `get-total-supply`, `get-balance`) and simulate transactions (`mint`, `transfer`).

### Running Tests (Optional)

You can add tests under the `tests/` directory. Once tests are in place:

```bash
clarinet test
```

## Getting Started

1. Change into the project directory (if not already there):
   ```bash
   cd /home/anthony/Documents/GitHub/samcoin
   ```
2. Check the contract:
   ```bash
   clarinet check
   ```
3. Optionally open the console to interact with the contract:
   ```bash
   clarinet console
   ```
