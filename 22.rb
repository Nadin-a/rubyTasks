hash = {key1: {key89: 454545454}, key2: {}, key3: {key4: 'str', key5: 'str2', key6: {key7: {key8: 1, key9: [2]}}}}

def find_by_key(hash, key)
  if hash.has_key?(key)
    p hash[key]
  else
    find_by_key(hash[hash.keys.last], key)
  end
end

find_by_key(hash, :key89)
