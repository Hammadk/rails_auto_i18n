module UniquifyID
  def uniquify_id(word, hash)
    word.downcase!
    if hash[word].nil?
      hash[word] = 1
      word
    else
      hash[word] += 1
      "#{word}_#{hash[word]}"
    end
  end
end

