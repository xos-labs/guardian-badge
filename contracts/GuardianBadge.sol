// SPDX-License-Identifier: MIT
// XOS GuardianBadge NFT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

/**
 * @title GuardianBadge
 * @dev Non-transferable NFT badge with signature-based minting
 */
contract GuardianBadge is ERC721, Ownable {
    using Strings for uint256;
    using ECDSA for bytes32;

    string public _baseTokenURI;
    uint256 public _tokenIds;
    address public signerAddress;

    /**
     * @dev Constructor initializes the contract with all parameters
     */
    constructor(
        string memory name,
        string memory symbol,
        string memory baseURI,
        address _signerAddress,
        uint256 startTokenId
    ) ERC721(name, symbol) {
        _baseTokenURI = baseURI;
        signerAddress = _signerAddress;
        _tokenIds = startTokenId;
    }

    /**
     * @dev Override transfer functions to make tokens non-transferable
     */
    function _transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override {
        revert("Tokens are non-transferable");
    }

    /**
     * @dev Override approve functions to make tokens non-approvable
     */
    function approve(address to, uint256 tokenId) public virtual override {
        revert("Tokens are non-approvable");
    }

    function setApprovalForAll(
        address operator,
        bool approved
    ) public virtual override {
        revert("Tokens are non-approvable");
    }

    /**
     * @dev Set base URI for token metadata
     * @param baseURI New base URI
     */
    function setBaseURI(string memory baseURI) external onlyOwner {
        _baseTokenURI = baseURI;
    }

    /**
     * @dev tokenURI URI
     */
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "Token does not exist");
        return _baseTokenURI;
    }

    /**
     * @dev totalSupply
     */
    function totalSupply() public view returns (uint256) {
        return  _tokenIds - 1000;
    }

    /**
     * @dev Mint new token with signature verification
     * @param signature Signature from authorized signer
     */
    function mint(bytes memory signature) external {
        require(balanceOf(msg.sender) == 0, "Already owns a badge");
        
        // Create message hash
        bytes32 messageHash = keccak256(
            abi.encodePacked(msg.sender, address(this))
        );
        bytes32 ethSignedMessageHash = messageHash.toEthSignedMessageHash();

        // Verify signature
        address recoveredSigner = ethSignedMessageHash.recover(signature);
        require(recoveredSigner == signerAddress, "Invalid signature");

        // Mint token
        _tokenIds += 1;
        _safeMint(msg.sender, _tokenIds);
    }

    /**
     * @dev Change signer address
     * @param newSigner New signer address
     */
    function setSigner(address newSigner) external onlyOwner {
        signerAddress = newSigner;
    }
}
