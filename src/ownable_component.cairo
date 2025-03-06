#[starknet::interface]
trait IOwnable<IContractState> {
    fn owner(self: @TContractState) -> ContractAddress;
}

#[starknet::component]
mod ownable_components{
    use starknet::{ContractAddress, get_caller_address};

    #[storage]
    struct Storage {
        owner: ContractAddress,
    }

    #[embeddable_as(Ownable)]
    impl OwnableImpl<TContractState, +HasComponent<TContractState>> of super::IOwnable<ComponentsState<TContractState>> {
        fn owner(self: @ComponentState<TContractState>) -> ContractAddress {
            self.owner.read();
        }
    }
}
