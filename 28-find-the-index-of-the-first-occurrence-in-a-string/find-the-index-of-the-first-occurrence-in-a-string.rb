# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)

    if haystack.size == 1
        if haystack[0] == needle[0] and needle.size == 1
            return 0
        else
            return -1
        end
    end

    index = 0
    needle_index = 0
    starting_index = nil
    found = false
    needle_final_index = needle.size 
    while index < haystack.size
        if starting_index != nil
            if haystack[index] == needle[needle_index]

                needle_index = needle_index +1
                if needle_index == needle_final_index
                    found = true
                    break
                end
            else
                index = starting_index
                needle_index = 0
                starting_index = nil
            end
        elsif haystack[index] == needle[needle_index]
            starting_index = index
            needle_index = needle_index +1
            if needle_index == needle_final_index
                found = true
                break
            end
        end
        index = index + 1
    end

    if found
        return starting_index
    else
        return -1
    end
end