// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol";

contract MyWhile {
    // sumar 'n' primeros numeros pares e impares
    //suma 'n' primeros numeros impares en otra variable 
    //retorna ambas sumatorias
    function sumNumbers(uint n) public pure returns (uint sumaPares, uint sumaImpares) {
        
        uint sumaPar = 0;
        uint sumaImpar = 0;
        uint i = 1;
        uint countPar = 0;
        uint countImpar = 0;

        while (countPar < n || countImpar < n) {
            if (i % 2 == 0 && countPar < n) {
                console.log("Sumar Par: ", i);
                sumaPar += i;
                countPar++;
            } else if (i % 2 != 0 && countImpar < n) {
                console.log("Sumar Impar: ", i);
                sumaImpar += i;
                countImpar++;
            }
            i++;
        }

        return (sumaPar, sumaImpar);
    }
}
