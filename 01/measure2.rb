def calcWindow(arr, start, last)
  sum = 0
  for i in start..last
    sum += arr[i].to_i
  end
  return sum
end

file = File.read("input.txt").split
increaseCount = 0
for i in 3..file.size-1
  prevSum = calcWindow(file, i-3, i-1)
  currentSum = calcWindow(file, i-2, i)
  increaseCount += 1 if currentSum > prevSum
end
puts increaseCount

