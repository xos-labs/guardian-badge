# Deployment Guide

## Prerequisites

- Access to an Ethereum node or testnet
- Contract deployment account with sufficient ETH
- Authorized signer account
- Solidity compiler ^0.8.0

## Contract Location

The contract for deployment is located at:
- `contracts/GuardianBadge.sol`

## Deployment Parameters

The contract constructor requires the following parameters:
1. `name`: Token collection name
2. `symbol`: Token symbol
3. `baseURI`: Base URI for token metadata
4. `signerAddress`: Address authorized to sign minting requests
5. `startTokenId`: Starting token ID (typically 1000)

## Deployment Steps

1. Deploy the contract with the required parameters
2. Verify the contract on Etherscan
3. Test minting with a valid signature
4. Transfer contract ownership if required

## Post-Deployment Verification

1. Verify the base URI is correctly set
2. Confirm the signer address is properly configured
3. Test minting with both valid and invalid signatures
4. Verify transfer restrictions are in place

## Network Configurations

### Mainnet
- Ensure all parameters are final before deployment
- Verify gas costs for all operations

### Testnet
- Use for testing signature verification
- Validate all administrative functions 