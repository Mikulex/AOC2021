file = File.read("input.txt").split
increaseCount = 0
lastNum = file.shift.to_i
for number in file
  number = number.to_i
  increaseCount += 1 if number > lastNum
  lastNum = number
end
puts increaseCount
