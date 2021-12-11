file = File.read("input.txt").split("\n")
depth = 0
distance = 0

for line in file
  line  = line.split(' ')
  case line[0]
  when "forward"
    distance += line[1].to_i
  when "up"
    depth -= line[1].to_i
  when "down"
    depth += line[1].to_i
  end
  
end
puts depth*distance
