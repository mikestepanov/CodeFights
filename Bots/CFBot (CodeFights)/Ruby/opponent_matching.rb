def opponentMatching(xp)
  matched = []
  best = nil
  while matched.size != xp.size / 2
    min_diff = nil
    (0...xp.size).each do |idx0|
      next if xp[idx0].nil?
      (idx0 + 1...xp.size).each do |idx1|
        next if xp[idx1].nil?
        diff = (xp[idx0] - xp[idx1]).abs
        if min_diff.nil? || min_diff > diff
          min_diff = diff
          best = [idx0, idx1]
        end
      end
    end
    matched << best
    xp[best[0]] = nil
    xp[best[1]] = nil
  end
  matched
end
