// Verifies that the unreduced value is equal to zero module the secp256r1 prime
//
// Completeness assumptions: val's limbs are in the (-2**249, 2**249).
// soundness assumptions: val's limbs are in the range(-2**248, 2**248).

// This is python Implementation is used in cairo for Hint But Validator Gives you wrong answer lead to Non-determinism Exploit So minimize it also verify it on chain so this not happen


func verify_zero{range_check_ptr}(val: UneducatedBigInt3) {
    alloc_locals;
    locals q;
    %{ from starkware.cairo.common.cairo_secp.secp256r1_utils import SECP256R1_P as SECP_P %}
    %{
        from starkware.cairo.common.cairo_secp.secp_utils import pack

        q,r = divmod(pack(ids.val, PRIME), SECP_P)
        assert r == 0, f"verify_zero: Invalid input {ids.val.d0, ids.val.d1, ids.val.d2}."
        ids.q = q % PRIME
    %}

    assert_165_bit(q + 2**164);
    // q in [-2**164, 2**164]

}