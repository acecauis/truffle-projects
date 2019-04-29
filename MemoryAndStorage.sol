pragma solidity ^0.4.24;

contract MemoryAndStorage {

    mapping(uint => User) users;

    struct User{
        uint id;
        uint balance;
    }
    constructor(){

    }
    function addUser(uint id, uint balance) public {
        ;
    }

}
