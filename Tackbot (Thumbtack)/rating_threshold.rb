def ratingThreshold(threshold, ratings)
  ans = []
  ratings.each.with_index do |_, idx|
    average = ratings[idx].inject(:+) / ratings[idx].size.to_f
    ans << idx if average < threshold
  end
  ans
end
