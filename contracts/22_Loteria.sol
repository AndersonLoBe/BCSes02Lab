// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Loteria is ERC20, Ownable {

    address public nft;
    address public ganador;

    mapping (address => address) public usuario_contract;

    constructor() ERC20("La Tinka Peru", "LTP") Ownable(msg.sender) {
        _mint (address (this), 1000);
        nft = address (new MainERC721());
    }
    //Calcula del precio de los tokens ERC-20
    function precioTokens (uint256 _numTokens) internal pure returns (uint256) { 
        return _numTokens * (1 ether);
    }

    //Visualizacion del balance de tokens ERC-20 de una cuenta
    function balanceTokens (address _account) public view returns (uint256) { 
        return balanceOf(_account);
    }

    //Visualizacion del balance de tokens ERC-20 pero del smart contract 
    function balanceTokensSC() public view returns (uint256) {
        return balanceOf(address(this));
    }

    //Visualizacion del balance de Ethers del smart contract 
    function balanceEthersSC() public view returns (uint256){
        address sc = address (this); 
        return sc.balance / (10 ** 18);
    }
    
    function mint(uint256 _nuevosTokens) public onlyOwner { 
        _mint(address(this), _nuevosTokens); //heredado de ERC20
    }

    


}

contract MainERC721 is ERC721 {
    constructor() ERC721("La Tinka NFT", "LTN") {
    }
}