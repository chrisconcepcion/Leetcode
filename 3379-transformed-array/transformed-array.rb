# @param {Integer[]} nums
# @return {Integer[]}
def construct_transformed_array(nums)
    result = Array.new(nums.size)

    i = 0
    while i < nums.size
        if nums[i] > 0
            result[i]  = nums[((i + nums[i])  % nums.size)]
        else
            result[i]  = nums[(nums[i] + i) % nums.size ]
        end
        i += 1
    end
    
    result
end