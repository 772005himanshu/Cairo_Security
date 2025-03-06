
## Lack of Access Control
In starknet Contract critical function should be protected by proper access control to avoid unauthorised access or unwanted state modification by third parties

```rust
#[starknet::contract]
mod Token {
    #[storage]
    struct Storage {
        total_supply: u256, // Stores the total supply of tokens
    }

    #[external(v0)]
    impl ITokenImpl of IToken {
        fn mint_tokens(ref self: ContractState, amount: u256) {
            // The mint_tokens function updates the total supply 
            // Without access control , anu user can call function , passing a risk
@>            self.total_supply.write(self.total_supply.read() + amount);
        }
    }
}
```

- To secure this we have to check over all function that access given is right or wrong

A mitigation for this vulnerability is to add another function , called at the beginning of `mint_tokens()` , that takes care of validating the caller which should be the same of the contract owner stored in the contract storage on deployment

```rust

```