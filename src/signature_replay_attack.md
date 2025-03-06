## Signature Replay Attack

- Signature replay Attack are a well known category of issues in the web3 world

- To Protected from the signature relay attack we have to use the nonces , domain seperator and chain ID (cross chain contract / multisigWallet)

- Preferably a domain separator is used to bind the signature to a specific contract and chain . It is good practice to also include the contract address in order to avoid authenticating tx for the other contract