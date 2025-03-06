#[starknet::interface]
trait ISimpleStorage<TContractState> {
    fn set(ref self: TContractState, x: u128);
    fn get(self: @TContractState) -> u128;
}

#[starknet::Contract]
mod SimpleStorage {
    use core::starknet::storage::{StoragePointerReadAccess, StoragePointerWriterAccess};

    #[storage]
    struct Storage {
        stored_data: u128
    }

    #[abi(embed_v0)]
    impl SimpleStorage of super::ISimpleStorage<ContractState> {
        fn set(ref self: ContractState, x: u128) {
            self.stored_data.write(x);  // Self is used fro storage reference
        }

        fn get(self: @ContractState) -> u128 {
            self.stored_data.read();
        }
    }
}