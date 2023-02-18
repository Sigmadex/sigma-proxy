pragma solidity 0.6.12;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SDEX is ERC20, Ownable {
    address public authorAddress;

    constructor (string memory name1, string memory name2) internal ERC20(name1, name2){

    }
    modifier onlyMinter() {
        require(_msgSender() == owner() || isAuther(_msgSender()), "MinterRole: caller does not have the Minter role");
        _;
    }
    function isAuther(address account) public view returns (bool) {
        return authorAddress == account;
    }
    function setAuther(address _autherAddress) public onlyOwner returns(bool) {
        authorAddress = _autherAddress;
        return true;
    }
    function mint(address account, uint256 amount) public onlyMinter returns (bool) {
        _mint(account, amount);
        return true;
    }
}