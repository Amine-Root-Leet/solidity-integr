pragma solidity ^0.8.0;

contract ContractManager {
    struct ContractDetail {
        string content; 
        mapping(address => bool) signatures; 
    }

    mapping(uint256 => ContractDetail) public contracts;
    uint256 public contractCounter = 0;

    function createContract(string memory content) external returns (uint256) {
        contracts[++contractCounter].content = content;
        return contractCounter;
    }

    function signContract(uint256 contractId) external {
        require(bytes(contracts[contractId].content).length > 0, "Contract doesn't exist");
        contracts[contractId].signatures[msg.sender] = true;
    }

    function hasSigned(uint256 contractId, address signer) external view returns (bool) {
        return contracts[contractId].signatures[signer];
    }
}
