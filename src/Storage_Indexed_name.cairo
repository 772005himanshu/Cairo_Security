fn calculate_base_and_offset_for_index (
    list_base: StorageBaseAddress, index: u32, storage_size: u8
) -> (StorageBaseAddress , u8) {
    let max_elements = POW2_8 / storage_size.into();  // Is se max no. of element nikal liye
    let (key,offset) = U32DivRem::div_rem(index,max_element.try_into().unwarp());


    let segment_base = storage_base_address_from_felt252(
        LegacyHash::hash(Storage_address_to_felt252(storage_base_address_to_felt252(list_base)),key)
    );

    (segment_base, offset.into().unwarp()* storage_size)


}