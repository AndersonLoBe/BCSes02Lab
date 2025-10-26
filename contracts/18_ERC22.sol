// SPDX-License-Identifier: GPL-3.0 
pragma solidity >=0.8.2 <0.9.0; 
import "hardhat/console.sol";
import "./15_IERC20.sol";

contract ERC22 is IToken20 {

    mapping (address => uint256) private _balances;
    //Owner (Luis) -> (Alice) 50 tokens
    mapping(address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;
    string private _name;
    string private _symbol;

    constructor(string memory name, string memory symbol_) {
        _name = name_;
        _symbol symbol_;
    }

    function name() public view virtual returns (string memory) { 
        return _name;
    }

    function symbol() public view virtual returns(string memory) { 
        return _symbol;
    }


}