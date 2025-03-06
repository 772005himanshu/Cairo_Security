# STANDARD

### ERCs & Learning ------>>   Standards <<-----------  Rust & ZK

## The community is still figuring out standard for cairo 


### OpenZepplein "Cairo Contracts" --> Read All Openzepplein contract for Good Base && Practice on the NODE Guardian

- Cairo use the snake_case implementation in the contract Mostly 

- Starknet has SNIPs like ERC in ethereum . Read the SNIPs for good Security 

### Security factor

- Cairo is a multi-level compiler

#### CAIRO --> SIERRA(Intermediate & stable for Cairo Network) --> CASM(Low -level & ZK Circuit)


- Learn about SIERRA Compiler issue and implementation is good to start with Cairo

## Cairo Basics

Cairo built around a special or unique data type - the field element or `felt` (A `felt` is analogous to a integer) . 
`Uint256` in solidity composed of :
- `low` - 128 bits
- `high` - 128 bits


There is no for loops in cairo.One has to use recursion to , for instance , be able to loop through an array 