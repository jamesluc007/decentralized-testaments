pragma solidity >=0.7.0 <0.9.0;

// Concepts:
// Original Owner: The initial owner of the funds.
// Inheritor/s: Those who shall receive the gift stated on the testament when the original owner is dead

contract ProofOfHumanity {
    function isRegistered(address _submissionID) external view returns (bool) {
    }
}

contract DecentralizedTestament{

    struct Testament{
        address _original_owner;
        address inheritor;
        // address [] _inheritors;
        // for next version
        // for each inheritor there is a porcentage of the
        // original owner funds.
        // mapping (address=>float) _inheritors
    }

    constructor () public{
        address poh_t = 0xC5E9dDebb09Cd64DfaCab4011A0D5cEDaf7c9BDb
        Testament [] testaments;
    }

    function sign_testament(address inheritor) public { //called by the original owner
        require (is_registered(msg.sender)==True); //msg.sender is the original owner
        //...
    }

    function require_funds (address deceased_address) public payable { //called by the inheritor
        require (is_dead(deceased_address) == True);
        for (uint i=0; i<testaments.length; i++) {
            if (testaments[i]._original_owner==deceased_address){
                break;
            }
        require(testaments[i].inheritor==msg.sender); //msg.sender is the inheritor
        }     
        transfer(deceased_address, msg.sender); 
    }
        
    }
    function transfer (deceased_address, inheritor) private {
        // Aca vas a necesitar accesso a la firma inicial
        // que debera estar alojada en la lista de testamentos somehow
    }
    
    function is_registered(address deceased_address) public {
        Deployed poh_dc;
        poh_dc = ProofOfHumanity(Self.poh_t);
        return dc.isRegistered(deceased_address); 
   }

    function is_dead(address deceased_address) public {
        return is_registered(deceased_address)==False; 
   }
