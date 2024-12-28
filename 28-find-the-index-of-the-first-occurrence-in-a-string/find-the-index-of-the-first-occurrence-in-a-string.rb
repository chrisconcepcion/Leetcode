# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
    j = needle.size - 1
    i = j
    while i < haystack.size
        dupped_i = i
        while haystack[dupped_i] == needle[j] and j > -1
            j -= 1
            dupped_i -= 1
        end

        if j == -1
            return dupped_i + 1
        else
            j = needle.size - 1
        end
        
        i += 1
    end
    
    -1
end