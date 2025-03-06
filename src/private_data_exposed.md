## Private Data Exposed On-Chain
As in solidity we have a misleading keyword `private` , which some may take to mean that there is private data, where infact all state on Starknet is public 

You read any data from the public blockchain and use that as the exploit as we seen in the `Solidity Security`

```rust
#[starknet::contract]
mod StoreSecretPassword {

    #[storage]
    struct Storage {
        not_very_secret_password: felt252,
    }

    #[constructor]
    fn constructor(_password: u256) {
        self.password.write(_password);
    }
}
```