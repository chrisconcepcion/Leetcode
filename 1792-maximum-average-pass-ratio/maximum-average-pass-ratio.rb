# @param {Integer[][]} classes
# @param {Integer} extra_students
# @return {Float}
def max_average_ratio(classes, extra_students)
    percentages = []
    all_pass = 0
    # Add all potential diff percentages to our percentages array.
    # potential diff =  (klass[0].to_f + 1)/(klass[1] + 1) - (klass[0].to_f/klass[1] )
    classes.each_with_index do |klass, i|
        current_percentage = (klass[0].to_f/klass[1] )
        if current_percentage != 1
            diff = (klass[0].to_f + 1)/(klass[1] + 1) - (klass[0].to_f/klass[1] )
            klass << diff
            percentages.push klass
        else
            all_pass += 1
        end
    end

    # Treat our array like a max heap by using insert at with binarch search to maintain 
    # a sorted array since heap class is slow in ruby.
    percentages.sort!{|a,b| a[2] <=> b[2]}
    if percentages.size > 0
        while extra_students > 0
            klass = percentages.pop

            klass[0] += 1
            klass[1] += 1
            diff = (klass[0].to_f + 1)/(klass[1] + 1) - (klass[0].to_f/klass[1] )
            klass[2] = diff
            
            extra_students -= 1
            i = percentages.bsearch_index{|v| v[2] > diff}
            if i == nil
                percentages << klass
            else
                percentages.insert(i, klass)
            end
        end
    end

    # Calculate answer.
    ans = 0
    while percentages.size > 0
        klass = percentages.pop
        ans += (klass[0].to_f/klass[1] )
    end

    
    (ans/classes.size) + (all_pass.to_f/classes.size)
end