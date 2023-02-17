pragma solidity 0.6.12;
import "@openzeppelin/contracts/access/Ownable.sol";
import "./SDEX.sol";

contract Proxy is Ownable{
    SDEX org;
    uint256 public count;
    mapping (address => uint256) contractInfo;
    address[] contractAddresses;
    constructor(address _sdex) public{
        org = SDEX(_sdex);
    }
    function addContractInfo(address _contract, uint256 _amount) public onlyOwner returns(bool) {
        contractInfo[_contract] = _amount;
        contractAddresses.push(_contract);
        count ++;
        return true;
    }
    function getContractInfo(address _contract) public view returns (uint256) {
        return contractInfo[_contract];
    }
    function distribueRewardContract(address _contract) public onlyOwner returns(bool){
        org.mint(_contract, contractInfo[_contract]);
        return true;
    }
    function distribueRewardContractALL() public onlyOwner returns(bool){
        for (uint256 i = 0; i < count; i ++) {
            org.mint(contractAddresses[i], contractInfo[contractAddresses[i]]);
        }
        return true;
    }
    
}