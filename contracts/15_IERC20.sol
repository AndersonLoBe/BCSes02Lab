// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

interface IToken20 {
    /**
    * Permite saber el numero de tokens que existen
    */
    function totalSupply() external view returns (uint256);
    /**
    * Permite saber el saldo de una direccion
    */
    function balanceOf(address account) external view returns (uint256);
    /**
    * Mover tokens de un emisor a un receptor (from 'msg.sender' -> to)
    */
    function transfer(address to, uint256 amount) external returns (bool);
    /**
    * El duenio autoriza a un tercero 'spender' para gastar cierta cantidad de sus tokens
    * Patron de delagacion, asociado con transferFrom
    */
    function approve(address spender, uint256 amount) external returns (bool);

    function allowance(address owner, address spender)
}