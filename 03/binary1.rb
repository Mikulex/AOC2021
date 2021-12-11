file = File.read("input.txt").split("\n")
count = Array.new(file[0].size,0)
gamma = ""
epsilon = ""
for line in file
  for i in 0..line.size-1
    count[i] += line[i].to_i
  end
end
puts count
for i in 0..count.size-1
  if count[i] > file.size/2
    gamma.concat "1"
    epsilon.concat  "0"
  else
    gamma.concat  "0"
    epsilon.concat  "1"
  end
end

puts gamma.to_i(2) * epsilon.to_i(2)
