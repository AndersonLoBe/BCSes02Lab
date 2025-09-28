// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol";

contract EjercicioMensajes { 
    struct Mensaje{
        address from;
        address to;
        string contenido;
        uint256 timestamp;
    }

    Mensaje[] public mensajes;
    
    function enviarMensaje (address _to, string memory _contenido) public{ 
        mensajes.push(Mensaje (msg.sender, _to, _contenido, block.timestamp));
    }

    function pintarDestinatarioMensajes() public view { 
        for (uint256 i = 0; i < mensajes.length; i++) {
            console.log("Mensaje a: ", mensajes[i].to);
        }
    }
}