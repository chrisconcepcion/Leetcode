# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
    i = 0
    j_start = 0
    j = 0
    next_attempts = []
    while i < haystack.size
        
        if needle.size == 1 and haystack[i] == needle[j]
            return i
        end
        

        if j > 0  
            
            if haystack[i] == needle[j]
                j += 1
                if needle[j] == nil
                    return j_start
                end
            else
                j = 0
                if next_attempts.size > 0
                    i = next_attempts.shift
                    j_start = i
                end 
            end
        end

        if haystack[i] == needle[0]
            if j > 0
                next_attempts << i
            end

            if j == 0
                j += 1
                j_start = i
            end
        end

        

        
        i += 1
    end

     if needle[j] == nil
                    return j_start
                end

    -1
end


def str_str_2(haystack, needle)
  return 0 if needle.length == 0
  
  i = 0
  while i < haystack.length
    j = needle.length - 1
    
    while j >= 0
      if haystack[i + j] == needle[j]
        j -= 1
      else
        break
      end
    end

    return i if j < 0

    k = j
    while k >= 0 && needle[k] != haystack[i + j]
      k -= 1
    end

    if k == -1
      i += j + 1
    else
      i += j - k
    end
  end
  
  return -1
end