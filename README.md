# Guardian Badge NFT

Guardian Badge is a non-transferable NFT (Non-Fungible Token) implementation based on the ERC721 standard. It's designed to serve as a proof of guardianship or membership, where each badge is unique and cannot be transferred after minting.

## Features

- **Non-transferable**: Once minted, badges cannot be transferred to other addresses
- **Signature-based minting**: Utilizes cryptographic signatures for authorized minting
- **One badge per address**: Each address can only mint one badge
- **Upgradeable metadata**: Base URI can be updated by the contract owner
- **Secure**: Built on OpenZeppelin's battle-tested contracts

## Contract Architecture

The contract (`contracts/GuardianBadge.sol`) inherits from OpenZeppelin's ERC721 and Ownable contracts, implementing:
- Signature verification for minting
- Transfer restrictions
- Metadata management
- Supply tracking

## Project Structure

## Dependencies

- OpenZeppelin Contracts v4.x
- Solidity ^0.8.0

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. 