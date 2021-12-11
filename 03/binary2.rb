file = File.read("input.txt").split("\n")
count = Array.new(file[0].size,0)
def commonValueAtIndex(arr, index)
  count = 0
  for line in arr
      count += line[index].to_i
  end
  return "1" if arr.size - count == arr.size/2 
  return count > arr.size/2 ? "1" : "0"
end

def filterOxygenCandidates(candidates)
  currentBit = 0
  while candidates.size > 1
    common = commonValueAtIndex(candidates, currentBit)
    new_candidates = []
    for i in 0..candidates.size-1
      new_candidates.push(candidates[i]) if candidates[i][currentBit] == common
    end
    candidates = new_candidates
    currentBit += 1
  end
  return candidates[0]
end 
def filterCo2Candidates(candidates)
  currentBit = 0
  while candidates.size > 1
    notCommon = commonValueAtIndex(candidates, currentBit) == "0" ? "1" : "0"
    new_candidates = []
    for i in 0..candidates.size-1
      new_candidates.push(candidates[i]) if candidates[i][currentBit] == notCommon
    end
    candidates = new_candidates
    currentBit += 1
  end
  return candidates[0]
end

puts filterOxygenCandidates(file).to_i(2) * filterCo2Candidates(file).to_i(2)
