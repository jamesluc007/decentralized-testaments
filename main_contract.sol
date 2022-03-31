pragma solidity >=0.7.0 <0.9.0;


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

    function sign(address _original_owner) public {
        require (is_registered(_original_owner)==True)
        //...
    }
    function require_funds () public payable { //called by the inheritor
        require (check_death(deceased_address) == True);
        // Agregar require para verificar que el heredero este en la lista
        // y se corresponda con el fallecido
        transfer(deceased_address, msg.sender) //msg.sender is the inheritor
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


    

    



