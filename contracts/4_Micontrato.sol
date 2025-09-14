// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Micontrato {
    uint private  codigo;
    address private owner;

    event CodigoModificado(uint anterior, uint nuevo);

    constructor () {
        codigo = 6918;
        owner = msg.sender;
        console.log("la direccion del propietario es: ",owner);
    }

    modifier isOwner(){
        //require(msg.sender == owner, "No eres el dueno del contrato");
        _;
    }

    function getCodigo() public view returns (uint) {
        return codigo;
    }

    function setCodigo(uint _codigo) external isOwner() {
        emit CodigoModificado(codigo, _codigo);
        codigo = _codigo;
        //console.log("Acaba de modificar el codigo");
    }

   

    function dimeDia() external pure returns(uint) {
        return 13;
    }

    function dimeManana() external pure isOwner returns(uint) {
        return 14;
    }
}