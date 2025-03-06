pragma solidity ^0.8.20;

contract L1ToL2Bridge {
    uint256 public constant STARKNET_FIELD_PRIME; // the prime order P of the elliptic curve used
    IERC20 public constant token; // some token deposit to L2

    event Deposited(uint256 to, uint256 amount);

    function depositedToL2(uint256 to, uint256 amount) public returns (bool) {
        require(to != 0 && to < STARKNET_FIELD_PRIME, "invalid address"); // verifies 1 < to < P
        token.transferFrom(msg.sender,address(this),amount);
        // Other code for cross-layer communication
        emit Deposited(to,amount);
        return true;
    }

}