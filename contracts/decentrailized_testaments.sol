//SPDX-License-Identifier: MIT

// Design considerations:
// All the involved people understand the basics of POH
// All the involved people have a POH account and will continue updating its alive status
// The inheritors know that the owner has deployed this contract
// Division is equitative among all the inheritors
//   A
// B C D
// What happens if C dies before A?

pragma solidity ^0.8.4;

contract Testament {
    mapping (address => uint) inheritors; // address -> 1 if it exists or -> 0 (default) if it does not exit
    address public owner;
    uint256 private ethbalance;
    uint8 private number_of_inheritors;

    event InheritorAdded(address inheritor_adr);
    event InheritorRemoved(address inheritor_adr);
    event InheritorGotItsPart(address inheritor_adr, uint amount);
    event EthOwnerDeposit(uint amount);
    event EthOwnerWithdraw(uint amount);

    constructor() {
        owner = msg.sender;
    }

    modifier only_owner {
        require (owner == msg.sender, "This method can be called only by the owner of the contract.");
        _;
    }

    modifier only_inheritors {
        require (inheritors[msg.sender] == 1, "This method can be called only by the inheritors.");
        _;
    }

    modifier only_inheritors_or_owner {
        require (inheritors[msg.sender] == 1 || owner == msg.sender, "This method can be called only by the inheritors.");
        _;
    }

    function deposit () public payable only_owner {
        ethbalance += msg.value;
        emit EthOwnerDeposit(msg.value);
    }

    function getBalance() public view only_inheritors_or_owner returns (uint256)  {
        return ethbalance;
    }

    function add_inheritor(address inheritor) public only_owner{
        inheritors[inheritor] = 1;
        number_of_inheritors+=1;
        emit InheritorAdded(inheritor);
    }

    function remove_inheritor(address inheritor) public only_owner{
        inheritors[inheritor] = 0;
        number_of_inheritors-=1;
        emit InheritorRemoved(inheritor);
    }

    function withdraw (uint amount) public only_owner {
        require (amount <= ethbalance, "You are trying to withdraw more than the available balance.");
        address payable to = payable(msg.sender);
        to.transfer(amount);
        emit EthOwnerWithdraw(amount);
    }

    function get_you_part () public only_inheritors {
        require (is_address_alive(owner) == false, "Owner is still alive! You cannot withdraw its money.");
        address payable to = payable(msg.sender);
        uint inheritor_portion = ethbalance/number_of_inheritors;
        to.transfer(inheritor_portion);
        remove_inheritor(msg.sender);
        emit InheritorGotItsPart(msg.sender, inheritor_portion);
    }  
    
    // private stuff:

    function is_address_alive (address check) private returns (bool){
        return true;
    }

}