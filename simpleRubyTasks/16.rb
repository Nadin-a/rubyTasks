m_hash = [
    { name: 'Membran', height: 168 },
    { name: 'Fisher', height: 186 },
    { name: 'Warden', height: 161 },
    { name: 'Smith', height: 176 },
    { name: 'Lerman', height: 174 }
]

p m_hash.max_by { |hash| hash[:height] }[:name]
