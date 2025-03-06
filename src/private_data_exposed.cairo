#[starknet:contract]
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