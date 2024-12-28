# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  return 0 if needle.empty?
  
  # Create a bad character table
  bad_char = {}
  needle.each_char.with_index do |char, index|
    bad_char[char] = index
  end

  i = 0
  while i <= haystack.length - needle.length
    j = needle.length - 1

    while j >= 0 && haystack[i + j] == needle[j]
      j -= 1
    end

    if j < 0
      return i  # Match found
    else
      # Get the last occurrence of the bad character in the needle
      bad_char_shift = bad_char[haystack[i + j]] || -1
      shift = [j - bad_char_shift, 1].max  # Ensure at least a shift of 1
      i += shift
    end
  end

  -1  # No match found
end