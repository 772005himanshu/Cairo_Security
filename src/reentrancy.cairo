#[starknet::contract]
mod MyReentrancyContract {
    use openzeppelin::security::ReentrancyGuardComponent;

    component!(
        path: ReentrancyGuardComponent, storage: reentrancy_guard, event: ReentrancyGuardEvent
    );

    impl InternalImpl = ReentrancyGuardComponent::InternalImpl<ContractState>;

    #[storage]
    struct Storage {
        #[substorage(v0)]
        reentrancy_guard: ReentrancyGuardComponent::Storage
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        #[flat]
        ReentrancyGuardEvent: ReentrancyGuardComponent::Event
    }

    #[external(v0)]
    fn protected_function(ref self: ContractState){
        self.reentrancy_guard.start();

        // Do something

        self.reentrancy_guard.end();
    }
}