// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract SimplePetAdoption {
    address public immutable owner;
    uint256 public constant RETURN_WINDOW = 2 minutes;

    struct Pet {
        string name;
        address adopter;
        uint256 timeAdopted;
    }

    Pet[] public pets;

    event PetRegistered(string name, uint256 id);
    event PetAdopted(address adopter, uint256 id);
    event PetReturned(address adopter, uint256 id);

    modifier onlyOwner() {
        require(msg.sender == owner, "Solo owner");
        _;
    }

    modifier onlyNotOwner() {
        require(msg.sender != owner, "Solo no-owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }


    function registerPet(string memory _name) external onlyOwner {
        require(bytes(_name).length > 0, "Nombre vacio");
        pets.push(Pet({ name: _name, adopter: address(0), timeAdopted: 0 }));
        emit PetRegistered(_name, pets.length - 1);
    }

    function adoptPet(uint256 _id) external onlyNotOwner {
        require(_id < pets.length, "ID invalido");
        Pet storage p = pets[_id];
        require(p.adopter == address(0), "Ya adoptada");
        p.adopter = msg.sender;
        p.timeAdopted = block.timestamp;
        emit PetAdopted(msg.sender, _id);
    }

    function returnPet(uint256 _id) external onlyNotOwner {
        require(_id < pets.length, "ID invalido");
        Pet storage p = pets[_id];
        require(p.adopter == msg.sender, "No eres el adoptante");
        require(
            block.timestamp <= p.timeAdopted + RETURN_WINDOW,
            "Tiempo de devolucion vencido"
        );
        p.adopter = address(0);
        p.timeAdopted = 0;
        emit PetReturned(msg.sender, _id);
    }

    function countAdopted() external view returns (uint256 count) {
        for (uint256 i = 0; i < pets.length; i++) {
            if (pets[i].adopter != address(0)) {
                count++;
            }
        }
    }
}
