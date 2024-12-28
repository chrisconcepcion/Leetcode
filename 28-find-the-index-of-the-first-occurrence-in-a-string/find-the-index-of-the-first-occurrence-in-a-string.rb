# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
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