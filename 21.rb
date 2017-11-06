INIT_ARR = [{a: 1, b: 4}, {a: 33, b: -8}, {a: -22, b: 23}, {a: -2.01, b: 77}, {a: 15, b: 13}].freeze

arr1 = INIT_ARR.dup
p arr1.map { |hash| hash.values.map { |item| item.positive? ? item : nil } }.flatten.compact.sort

arr2 = INIT_ARR.dup
p arr2.map { |item| item[:a] }.detect(&:negative?)

arr3 = INIT_ARR.dup
p({
    a: arr3.map { |item| item[:a] }.sum,
    b: arr3.map { |item| item[:b] }.sum
  }
)

arr4 = INIT_ARR.dup
p arr4.sort_by { |item| item[:b] }

arr5 = INIT_ARR.dup
p arr5.select { |item| item[:b] % 2 == 0 }

arr6 = INIT_ARR.dup
p arr6.select { |item| item[:a].negative? && item[:b].negative? }