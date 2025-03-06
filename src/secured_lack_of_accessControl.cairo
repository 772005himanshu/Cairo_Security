#[starknet::contract]
mod Token {
    #[storage]
    struct Storage {
        owner : ContractAddress, // Here we are storing the contract owners address
        total_supply: u256, // Stores the total supply of tokens
    }

    #[constructor]
    fn constructor(ref self: ContractState){
        let sender = get_caller_address(); // Get the address of the contract Creator
        self.owner.write(sender); // Set the creator as the owner
    }

    #[external(v0)]
    impl ITokenImpl of IToken {
        fn mint_tokens(ref self: ContractState, amount: u256) {
            assert(owner == self.get_caller_address() );
            self.total_supply.write(self.total_supply.read() + amount);
        }
    }
}