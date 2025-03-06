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
            self.total_supply.write(self.total_supply.read() + amount);
        }
    }
}