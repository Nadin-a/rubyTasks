INIT_HASH = {
    a: 12,
    b: 74.9,
    c: [23, 44, 66, -8, 124],
    d: 'Some String',
    z: { ca: 'Inherit hash', cb: 112 }
}.freeze
hash1 = INIT_HASH.dup
hash1.delete_if { |_, value| value.is_a?(Numeric) || value.is_a?(String) }
p hash1
hash2 = INIT_HASH.dup
p new_hash = hash2.keys.reverse.zip(hash2.values).to_h
