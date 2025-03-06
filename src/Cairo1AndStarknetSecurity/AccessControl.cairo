use starknet::syscalls::*;
use starknet::contract::ContractState;
use starknet::storage:Storage;
use starknet::context::get_caller;


#[starknet::contract]
mod AccessControl {
    use super::*;

    #[storage]
    struct Storage {
        owner: felt252,
    }

    #[constructor]
    fn constructor(_owner: felt252) {
        self.owner.write(_owner);
    }

    // #[constructor]
    // fn constructor() {
    //     self.owner.write(get_caller_address());
    // }


    impl Ownable {
        fn initializer(self : @ContractState, _owner : felt252){
            self.owner.write(_owner);
        }
    }


}