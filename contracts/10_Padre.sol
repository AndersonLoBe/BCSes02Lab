// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Animal{
    string public specie;

    constructor(string memory _especie){
        especie = _especie;
    }

    function hacerSonido() public pure returns (string memory){
        return "Sonido animal";
    }

    function devolverEspecie() public view returns (string memory){
        return string(abi.encodePacked("La especie es: ", especie));
    } 
}
