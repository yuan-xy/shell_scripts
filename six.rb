# 有6堆牌，张数分别为1到6。两个人轮流拿牌，每次只能从一堆中拿牌，一次可以拿一张牌也可以拿多张牌，但是最多只能拿完该堆所有的牌。拿到最后一张牌的人输。
$result = {"[1]" => "lost"}
SIZE=6
(2..SIZE).each{|x| $result["[#{x}]"] = "win" }

def gen_seq
    len=1
    while len<=SIZE
    	arr = []
    	len.times{ arr.push(1)}
    	yield arr
    	while true
    		cursor = len-1
    		while cursor>=0
    			break if arr[cursor] < SIZE
    			cursor -= 1
    		end
    		#puts "cursor:#{cursor}, len:#{len}"
    		if cursor>=0
    			arr[cursor] += 1
    			idx = cursor+1
    			while idx < len
    				arr[idx] = arr[cursor]
    				idx += 1
    			end
    			yield arr
    		else
    			len +=1
    			break
    		end
    	end
    end
end

#gen_seq{|x| puts x.to_s}

def nextmove(array)
	arr = array.sort
	idx = arr.size-1
	while idx>=0
		value = arr[idx]
		while value>0
			value -=1
			arr[idx] = value
			yield arr.delete_if{|x| x==0}
		end
		idx -=1
		arr = array.sort
	end
end

def win?(array, print_solution=false)
	return "lost" if array==[1]
	return "win" if array.size==1 && array[0]>1
	nextmove(array) do |arr|
		arr = arr.sort
		if $result[arr.to_s] == "lost"
			puts "#{array.to_s} -> #{arr.to_s}" if print_solution
			return "win"
		end
		raise "error found！ #{array.to_s} move to #{arr.to_s}" if $result[arr.to_s].nil?
	end
	return "lost"
end

def solve(array)
	gen_seq do |arr|
		flag = (arr == array.sort)
		win = win?(arr, flag)
		$result[arr.to_s] = win
		puts "#{arr.to_s} -> #{win}" if win == "lost"
		if flag
			puts "found #{arr} -> #{win}"
			return
		end
	end
end

solve([1,2,3,4,5,6])