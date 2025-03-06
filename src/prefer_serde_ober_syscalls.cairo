// Prefer Serde Over SysCall

// Based on serialize and Deserialize

trait Serde<T> {
    fn serialize(self : @T, ref Output : Array<felt252> );
    fn deserialize(ref serialized: Span<felt252>) -> Option<T>;
}

impl TupleSize0Serde of Serde<T> {
    fn serialize(self : @T, ref Output : Array<felt252> ){}
    fn deserialize(ref serialized: Span<felt252>) -> Option() {
        Option::Some(())
    }
}