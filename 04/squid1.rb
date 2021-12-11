require 'set' 

$file = File.readlines("input.txt", chomp: true)
$randomNumbers = $file.shift().split(",")
$file.shift

$cardList = []
$calledNums = Set.new

def collectCards
    card = []
    while $file.size > 0
        if $file.first.empty?
            $cardList.push(card)
            card = []
            $file.shift
        else
            card.push($file.shift.split(" "))
        end
    end
end

def play
    collectCards
    for nextNum in $randomNumbers
        $calledNums.add(nextNum)
        for card in $cardList    
            return sumUnmarked(card) * nextNum.to_i if checkWin(card,nextNum) 
        end
    end 
end

def playUntilLastCard
    $calledNums = Set.new
    for nextNum in $randomNumbers
        $calledNums.add(nextNum)
        for card in $cardList
            if checkWin(card, nextNum)
                if $cardList.size > 1
                    $cardList.delete(card) 
                else 
                    return sumUnmarked(card) * nextNum.to_i
                end
            end
        end
    end
end

def checkWin(card, number)
    return checkVerticalWin(card) || checkHorizontalWin(card)
end

def checkVerticalWin(card)
    for i in 0..card[0].length-1
	    found = true
            for row in card 
                if !$calledNums.include?(row[i])
                    found = false
                end
            end
	    return true if found
    end
    return false
end

def checkHorizontalWin(card)
    for row in card
        return true if row.map{|val| $calledNums.include?(val)}.reduce(true){|result,val| result && val}
    end	
    return false
end
 
def sumUnmarked(card)
    return card.map{|row| row.map{|val| $calledNums.include?(val) ? 0 : val.to_i}.reduce(:+)}.reduce(:+)
end

puts play
puts playUntilLastCard
