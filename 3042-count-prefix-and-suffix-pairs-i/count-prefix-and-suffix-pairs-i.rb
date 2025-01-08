# @param {String[]} words
# @return {Integer}
def count_prefix_suffix_pairs(words)
    answer = 0
    i = 0
    while i < words.size
        j = i + 1
        while j < words.size
            if words[i].size <= words[j].size
                prefix = words[j][0..(words[i].size - 1)] 
                suffix = words[j][(words[j].size - words[i].size)..(words[j].size - 1)]
                if prefix == words[i] and suffix == words[i]
                    answer += 1
                end
            end
            j += 1
        end
        i += 1
    end

    answer
end