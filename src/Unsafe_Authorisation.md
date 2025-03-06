## Using Unsafe Authorization:

In Cairo, we have equivalents of solidity `msg.sender` and `tx.origin`.

- `account_contract_address` corresponds to `tx.origin` a global variable which stores the address of the transaction initiator
- `get_caller_address` corresponds to `msg.sender` which stores the address of the immediate caller

As the Solidity, using the transaction initiator `account_contract_address` to authenticate the function caller may leads to phishing attacks and allows attacker to impersonate critical roles such as the contract owner.


For example:
```rust
#[starknet::Contract]
mod Unsafe_Authorisation {
    use starknet::get_caller_address;
    use box::BoxTrait;

    #[storage]
    struct Storage {
        owner: ContractAddress,
    }


    fn constructor {
        // Initialize the owner as the contract deployer
        let contract_deployer = get_caller_address();
        self.owner.write(contract_deployer);
    }


    #[external(v0)]
    impl ITokenImpl of Token {
        fn transfer(ref self: ContractState, to: ContractAddress, amount: u256) {
            let tx_info = starknet::get_tx_info().unbox();

@>            let authorizer: ContractAddress = tx.account_info.account_contract_address;
            // Verifies the transaction initiator as the owner.
            assert(authorizer == self.owner.read());
            // Process to fund transfer
            self.balance.write(to + amount);

        }
    }


}
```


Remediation: Donot use the `account_contract_address` in the smart contract use `get_caller_address`

```rust
#[starknet::Contract]
mod Unsafe_Authorisation {
    use starknet::get_caller_address;
    use box::BoxTrait;

    #[storage]
    struct Storage {
        owner: ContractAddress,
    }


    fn constructor {
        // Initialize the owner as the contract deployer
        let contract_deployer = get_caller_address();
        self.owner.write(contract_deployer);
    }


    #[external(v0)]
    impl ITokenImpl of Token {
        fn transfer(ref self: ContractState, to: ContractAddress, amount: u256) {
            let tx_info = starknet::get_tx_info().unbox();

-            let authorizer: ContractAddress = tx.account_info.account_contract_address;

+            let authorizer: ContractAddress = tx.account_info.get_contract_address();
            // Verifies the transaction initiator as the owner.
            assert(authorizer == self.owner.read());
            // Process to fund transfer
            self.balance.write(to + amount);

        }
    }


}

```