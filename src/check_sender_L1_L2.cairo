// Check sender in L1 to L2 in messages 

#[l1_handler]

fn ex_01_receive_message_from_l1(
    ref self: ContractState, from_address: felt252, message: usize
) {
    // Selector: Address(selector) ,makeAddr("Selector") / Sender
    // Check sender is the correct l1 evaluator
    assert(from_address == self.l1_evaluator_address.read(), "WRONG L! EVALUATOR");

    // Adding a check on the message , because wny not ?
    assert(message > 168111, "Message too small");
    assert(message < 5627895, "Message is Too Big");

    // Store the message received from L! 
    let mut message_count = self.message_count.read();

    message_count += 1;
    self.message_count.write(message_count);
}