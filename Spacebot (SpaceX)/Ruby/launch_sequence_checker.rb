def launchSequenceChecker(names, numbers)
  container = {}
  (0...names.size).each do |idx|
    if container.key?(names[idx])
      container[names[idx]] << numbers[idx]
    else
      container[names[idx]] = [numbers[idx]]
    end
  end
  container.each do |sys, num|
    return false if num != num.sort || num != num.uniq
  end
  true
end
