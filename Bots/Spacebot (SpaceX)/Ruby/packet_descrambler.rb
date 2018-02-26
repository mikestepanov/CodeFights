def packetDescrambler(seq, data, n)
  return "" unless no_gaps?(seq)
  hash = group_up_data(seq, data)
  data = recover_data(hash, n)
  if data.compact != data || data[0...-1].include?("#") || data.last != "#"
    ""
  else
    data.join
  end
end

def no_gaps?(seq)
  seq = seq.uniq.sort
  return true if seq.size == 1
  (0...seq.size - 1).each do |idx|
    return false if seq[idx] != seq[idx + 1] - 1
  end
  true
end

def group_up_data(seq, data)
  hash = {}
  (0...data.size).each do |idx|
    if hash.key?(seq[idx])
      hash[seq[idx]] << data[idx]
    else
      hash[seq[idx]] = [data[idx]]
    end
  end
  hash
end

def recover_data(hash, n)
  msg = []
  hash = hash.sort_by{|k, _| k}.to_h
  hash.each_value do |data|
    data = most_common(data)
    if data.last > n / 2.0
      msg << data.first
    else
      msg << nil
    end
  end
  msg
end

def most_common(data)
  hash = Hash.new(0)
  data.each do |str|
    hash[str] += 1
  end
  hash.max_by{|_, v| v}
end
