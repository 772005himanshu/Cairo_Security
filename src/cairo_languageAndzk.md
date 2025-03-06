## Cairo Language overview:

- Cairo is a Turning - complete programming language designed STARK-provable programs that enable general computation.
- This can be used at a low level and features a read-only non-deterministic memory.This means that while prover selects the value for each memory cell,these values remain constant and cannot be altered over time.

## Basic Overview of Starknet:


Cairo 1 --> Sierra --> CASM (cairo compiler)

### Safe Intermediate Representation(SIERRA)
- This intermediate language is represented Transaction should be provable .
- When Transaction fails Asserts are converted to if statements , if it returns false we don't do any modification
- if the Transaction fails we cannot prove that it fails so we introduce this intermediate language

- Contracts will count gas still needs to be low level enough to be efficient SO the process would be Cairo Smart Contract => Sierra => Cairo Assembly => Validity Proof

Sierra bytecode:
- cannot fails
- counts gas (we are counting he gas it tx fails use this as Proof)
- compile to Cairo with virtually no overhead

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

### Ownership : 
- Is Crucial fro ensuring the memory safety and enabling concurrency
- Cairo ownership is essential for making code provable and for abstracting the immutable nature of the memory model.


### References and Snapshots Overview
- A snapshot gives us a view of the state of a contract at particular time, it is immutable Operator.
- `@` is the snapshot operator , for example used as a parameter.
```Rust
fn calculate_length(array : @Array<u128>)
```
- `*` is the `desnap` operator , it lets us convert a snapshot back to a normal variable

```Rust
fn calculate_area(rec: @Rectangle) -> u64 {
    *rec.height * *rec.width
}
```


## Difference Between Solidity and Cairo 

### - Felt Data Type:
    - Unlike The EVM which uses 32-bytes integer for arithmatic operation, Cairo utilizes (Field Element) data types.
    - All arithmetic in cairo is performed modulo(P) , affecting how division is handled. 
    - For division , we cannot divide the number directly for we have to prove it with multiplication, (so we are going right).




## Advance Features
- `#[straknet::components]` - declaration of components

```rust
#[starknet::components]
mod ownable_component {
   
}
```

- `#[generate_trait]` generation of the trait of an implementation
```rust
#[generate_trait]
impl InternalImpl of InternalContract {
    
}
```
