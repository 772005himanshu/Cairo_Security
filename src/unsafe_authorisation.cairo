#[starknet::contract]
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

            let authorizer: ContractAddress = tx.account_info.account_contract_address;
            // Verifies the transaction initiator as the owner.
            assert(authorizer == self.owner.read());
            // Process to fund transfer
            self.balance.write(to + amount);

        }
    }


}
