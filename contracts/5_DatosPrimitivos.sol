// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol";

contract DatosPrimitivos{
    uint public saldo;
    bool public pausado;
    address public owner;
    bytes32 public clave;

    function incrementar(uint valor) public {
        saldo += valor;
    }

    function asignarPausado(bool valor) public{
        pausado = valor;
    }

    constructor(){
        owner = msg.sender;
    }

    function cambiarOwner(address _nuevoPropietario) public {
        owner = _nuevoPropietario;
    }

    function setClave(string memory _str) public {
        clave = keccak256(abi.encodePacked(_str));
    }
}
