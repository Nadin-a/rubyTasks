hash = {
    key1:
        {
            key2: 454545454, key3: 19, key4:
            {
                key5: 'a', key6: 'b', key7: 'c', key8:
                {
                    key200: { key300:'hfkdjghdfkjg' }, key9: 'abc'
                }
            }
        },
    key10: {},
    key11:
        {
            key12: 'str', key13: 'str2', key14:
            {
                key7: {key15: 1, key16: [2], key17:
                    {
                        key18: 11111, key19: 2222, key20:
                        {
                            key21: 2000, key22: 220000, key23:
                            {
                                key24: '555', key25:
                                {
                                    key26: '888', key27:
                                    {
                                        key28: '!!!!', key29: { key100: '100'},
                                        key30: { key31: 'END' }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
}

def find_by_key(hash, key)
  if hash.has_key?(key)
    p hash[key]
  else
    hash.select {|k| find_by_key(hash[k], key) if hash[k].is_a? Hash}
  end
end
find_by_key(hash, :key300)


