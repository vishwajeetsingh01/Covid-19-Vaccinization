pragma solidity ^0.5.0;

contract StructStorage {

    uint256 public s = 1; 
    uint256 public c;
    uint256 public t=1;
    mapping (address => uint) balances;

    function fundaddr(address addr) public{
        balances[addr] = 2000;
    }

        function sendCoin(address receiver, uint amount, address sender) public returns(bool sufficient){
        
        
        if (balances[sender] < amount) 
        return false;
        
        balances[sender] -= amount;
        balances[receiver] += amount;
        
                        
        return true;
        
    }

    function getBalance(address addr) view public returns(uint){
        return balances[addr];
    }
struct patient { 
   
    bytes pid; 
    bytes32 pname; 
    bytes32 loc;
    bytes32 vaccinename;
    uint256 contact;
    uint quantity;
    uint exprice;
}

struct vaccine { 

    bytes vaccineno; 
    bytes grade;
    uint mrp;
    bytes32 testdate;
    bytes32 expdate;
}

address public tester;
address owner;

mapping (bytes => patient) f1;
patient[] public fm;

mapping (bytes => vaccine) l1;
vaccine[] public l;



function produce(bytes memory id, bytes32 name, bytes32 loc, bytes32 cr, uint256 con, uint q, uint pr) public{
               
        StructStorage.patient memory fnew = patient(id,name,loc,cr,con,q,pr);
        f1[id] = fnew;
        fm.push(fnew);
        s++;
  
}
    
 function getproduce(bytes memory j) public view returns(bytes memory,bytes32,bytes32,bytes32,uint256,uint,uint) {
        return (f1[j].pid,f1[j].pname,f1[j].loc,f1[j].vaccinename,f1[j].contact,f1[j].quantity,f1[j].exprice);
    }
 function quality(bytes memory ll, bytes memory g, uint256 p, bytes32 tt, bytes32 e) public{
    
        StructStorage.vaccine memory lnew=vaccine(ll,g,p,tt,e);
        l1[ll]=lnew;
        l.push(lnew);
        t++;
  
 }  
 function getquality(bytes memory k) public view returns(bytes memory,bytes memory,uint,bytes32,bytes32) {
     return(l1[k].vaccineno,l1[k].grade,l1[k].mrp,l1[k].testdate,l1[k].expdate);
     
 }
}
