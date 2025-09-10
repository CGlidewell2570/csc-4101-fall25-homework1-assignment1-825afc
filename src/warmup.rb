def fib(n)
    if n <= 0
        return []
    end 
    if n == 1
        return [0]
    end
    fibArray = [0, 1]
    (n-2).times do
        fibArray << fibArray[-1] + fibArray[-2]
    end

    fibArray
end

def isPalindrome(n)
    org = n.to_s
    rev = org.reverse
    org == rev
end

def nthmax(n, a)
    return nil if a.empty? || n < 0 || n >= a.size
    sorted = a.sort.reverse
    sorted[n]
end

def freq(s)
    return "" if s.size == 0
    counts = Hash.new(0)
    org = s.split("")
    org.each {|char| counts[char] += 1}

    counts.max_by {|char, count| count}[0]
end

def zipHash(arr1, arr2)
    return nil if arr1.size != arr2.size

    result = {}
    arr1.each_with_index do |element, index|
        result[element] = arr2[index]
    end
    result
end

def hashToArray(hash)
    hash.to_a
end
