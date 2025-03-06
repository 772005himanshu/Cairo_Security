## L2 Function Not callable From L1
If you want to call the smart contract deployed on Starknet from Ethereum you must specify the function `selector` when invoking the `sendMessageToL2()` function of `starknetMessaging` contract deployed on ethereum
Function you want to invoke must has the `#[l1_handler]` attribute otherwise it will not be callable from the L1.
Layer 2 function must have `from_address: felt252` as teh second input after contractState.`from_address` represent the `msg.sender` of the l1 Tx that invoke the function on starknet.


Also function selector differ in L1 and L2:
- Solidity function selector is 32 bits long and first 4 bytes of the Keccak256 hash of function name and the argument data type
- Starknet function selector is felt252 type and its computed with the pedersen hash of the function name without function argument types