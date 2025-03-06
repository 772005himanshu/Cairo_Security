## L2 message not consumed on L1

If the contract deployed on starknet wants to send a message on ethereum should use `syscall` named `send_message_to_l1_syscall` available in syscalls package . It must specify teh L1 recipient and the payload which contains the message/data to be sent.

Unlike L1 -> L2 messages, L2 -> L1 messages must be consumed manually 