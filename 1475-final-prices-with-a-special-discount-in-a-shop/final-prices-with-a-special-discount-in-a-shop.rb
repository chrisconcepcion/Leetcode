# @param {Integer[]} prices
# @return {Integer[]}
def final_prices(prices)
    stack = [0]
    j = 1
    while j < prices.size
        # our requirements are:
        # 1. i < j
        # 2. prices[j] <= prices[i]
        # Indexes in our stack are always less than index making it i in i < j
        while stack.size > 0 and prices[j] <= prices[stack[-1]]
            i = stack.pop
            prices[i] = prices[i] - prices[j]
        end

        stack << j
        j = j + 1
    end

    prices
end

# prices = [8,9,6,2,3]