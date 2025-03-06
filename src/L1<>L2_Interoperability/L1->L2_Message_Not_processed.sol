pragma solidity ^0.8.20;

contract L1ToL2Bridge {
    IERC20 public token; // some token to deposit on L2

    function depositToL2(address to, uint256 amount) public returns (bool) {
        require(token.transferFrom(msg.sender, address(this), amount));
        // ...
        StarknetCore.sendMessageToL2(data);
        return true;
    }
}