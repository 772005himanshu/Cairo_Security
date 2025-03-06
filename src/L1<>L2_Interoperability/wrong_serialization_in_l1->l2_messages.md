## Wrong Serialization in L1 -> L2 Messages

If we want to send data from L1 -> L2 we must have serialize everything into a payload which is an array of `uint256` . Then payload should be used as one of the argument of `sendMessageToL2()` function on the StarknetMessaging contract deployed on L1. 
We must serialization of your data into the uint256 array follow the Cairo Serialization scheme.

### Not Enough Wei sent For L1 -> L2 Communication

At least `msg.value` should be atleast 20k wei due to the fact that `StarknetMessaging` contract will register the hash of our message in the storage plus the amount you want to transfer.