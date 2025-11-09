// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MiniNFT is ERC721 {

    uint256 private _nextTokenId;
    address private owner;

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {
        owner = msg.sender;
    }

    modifier isOwner(){
        require(msg.sender == owner, "No eres el dueno del contrato");
        _;
    }

    function mint(address to) public {
        _safeMint(to, _nextTokenId++);
    }
}