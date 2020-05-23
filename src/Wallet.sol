pragma solidity 0.6.0;
pragma experimental ABIEncoderV2;

contract Wallet {
    address[] public approvers;     // only returns a single instance of the array address[] / we need getApprovers()
    uint public quorum;
    struct Transfer {
        uint id;
        uint amount;
        address payable to;
        uint approvals;
        bool sent;
    }
    Transfer[] public transfers;    // only returns a single instance of the array Transfer[] / we need getTransfers()

    contructor(address[] memory _approvers, uint _quorum) public {
        approvers = _approvers;
        quorum = _quorum;
    }

    function getApprovers() external view returns(address[] memory) {   // returns a list of approvers
        return approvers;
    }

    function getTransfers() external view returns(Transfer[] memory) {  // returns a list of transfers
        return transfers;
    }

    function createTransfer(uint amount, address payable to) external {
        transfers.push(Transfer(
            transfers.length,
            amount,
            to,
            0,
            false
        ));
    }
}