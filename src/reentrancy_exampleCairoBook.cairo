#[starknet::contract]
mod ReentrancyExample {
    #[storage]
    struct Storage {
        available_swords: u256, // Stores available swards
        swords: LegacyMap::<ContractAddress, u256>,
        whitelisted: LegacyMap::<ContractAddress, u256>,

    }

    #[constructor]
    fn constructor(ref self: ContractState) {
        self.available_swords.write(1000); // initialize swards count
    }


    #[external(v0)]
    impl IGameImpl of IGame {
        fn mint_one_sword(ref self: ContractState) {
            let sender = get_caller_address();
            if self.whitelisted.read(sender) {
                // update the swords count before minting
                let sword_count = self.available_swords.read();
                self.available_swords.write(swords_count - 1);
                // Mint a swords
                self.swords_write(sender,1);
                // Callback to sender's contract
                let callback = ICallerDispatcher { contract_address: sender}.on_receive_sword();
                // Remove sender from whitelist after callback to prevent reentrancy
                self.whitelisted.write(sender,false);
            }
        }
    }
}