// Not every Account abstraction contract can be trusted
// Mostly cairo or straknet work on the Smart Wallet , or account abstraction is mostly used there in almost all wallet 

#[external(v0)]

impl PublicKeyImpl of super::PublicKeyTrait<ContactState> {
    fn get_public_key(self : @ContractState) -> felt252 {
        self.public_key.read()
    }

    fn set_public_key(refs self : ContractState, new_public_key: felt252) {
        // State the private key is not considered secure,
        // only the master account should be able change the public key ass opposed to self

        assert_only_master(@self);
        self.public_key.write(new_public_key);
    }
}