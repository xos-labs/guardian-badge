# Guardian Badge API Documentation

## Contract Location

The main contract is located at `contracts/GuardianBadge.sol`

## Contract Functions

### Public Functions

#### mint(bytes memory signature)
Mints a new badge to the caller's address.
- Requires a valid signature from the authorized signer
- Each address can only mint one badge
- Emits a Transfer event (standard ERC721)

### Admin Functions

#### setBaseURI(string memory baseURI)
Updates the base URI for token metadata.
- Only callable by contract owner
- Affects all existing and future tokens

#### setSigner(address newSigner)
Updates the authorized signer address.
- Only callable by contract owner

### View Functions

#### tokenURI(uint256 tokenId)
Returns the token metadata URI.
- Requires token to exist

#### totalSupply()
Returns the total number of minted badges.

## Signature Verification

The minting process requires a valid signature that can be generated off-chain by the authorized signer. The signature is created by signing a message containing:
- The recipient's address
- The contract address

## Security Considerations

1. Non-transferability is enforced at the contract level
2. Signature verification prevents unauthorized minting
3. One badge per address limit
4. Owner-only administrative functions 