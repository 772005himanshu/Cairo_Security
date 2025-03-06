## L1 to L2 Message Failure

In Starknet, Ethereum contracts can send messages from L1 to L2 using a bridge. However, it is not guaranteed that the message will be processed by the sequencer.

Because of sudden hike in gas price and the value is provided is low . This leads to tx to pending state . So we have to option to user to `cancel` the request .


This also lead to `DOS Attack` because `cancellation` process take 5 days almost if malicious attacker call cancel again and again this lead to contract breakage.


Almost same type of Vulnerability:

### Not Enough Wei sent For L1 -> L2 Communication

At least `msg.value` should be atleast 20k wei due to the fact that `StarknetMessaging` contract will register the hash of our message in the storage plus the amount you want to transfer.