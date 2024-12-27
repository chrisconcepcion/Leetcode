# @param {Integer[]} values
# @return {Integer}
def max_score_sightseeing_pair(values)
    max_at_i = Array.new(values.size) { 0 }
    max = values[-1] 
    max_at_i[-1] = 0
    i = values.size - 2
    while i > -1
        val = values[i+1] - 1
        max -= 1
        max = [max, val].max
        max_at_i[i] = max
        i -= 1
    end
    
    answer = 0
    values[0..-2].each_with_index do |x,i| 
        answer = [answer, x + max_at_i[i]].max
    end

    answer
end

