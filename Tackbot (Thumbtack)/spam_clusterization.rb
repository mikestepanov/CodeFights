# not complete - 7/9

def spamClusterization(requests, ids, threshold)
  requests = convert_to_words(requests)
  jaccard = calculate_index(requests, threshold)
  jaccard = group_up!(jaccard)
  get_id(jaccard, ids)
end

def get_id(jaccard, ids)
  jaccard.map! do |arr|
    arr.map! do |idx|
      ids[idx]
    end
    arr.sort!
  end
end

def group_up!(jaccard)
  new_jaccard = []
  until jaccard.size.zero?
    new_jaccard << jaccard.pop
    jaccard.map! do |arr|
      if arr.any?{|i| new_jaccard.last.include?(i)}
        new_jaccard.last << arr
        new_jaccard.last.flatten!.uniq!
        nil
      else
        arr
      end
    end
    jaccard.compact!
  end
  new_jaccard.select{|ar| ar.size > 1}
end

def convert_to_words(requests)
  requests = requests.map do |request|
    request.scan(/\w+/).uniq.map(&:downcase)
  end
  requests
end

def calculate_index(requests, threshold)
  jaccard = []
  (0...requests.size).each do |idx|
    pool = [idx]
    (0...requests.size).each do |idxx|
      if idx != idxx
        ans = jaccard_valid?(requests[idx], requests[idxx], threshold)
        pool << idxx if ans
      end
    end
    jaccard << pool
  end
  jaccard
end

def jaccard_valid?(target, other, threshold)
  (other & target).size / (other + target).uniq.size.to_f >= threshold
end
