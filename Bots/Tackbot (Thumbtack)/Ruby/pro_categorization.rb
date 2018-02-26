def proCategorization(pros, preferences)
  ans = []
	idx0 = 0
  preferences.each.with_index do |pref, idx|
    until preferences[idx].empty?
      temp = preferences[idx].pop
  		include = false
  		ans.each.with_index do |arr, idx|
  		  if arr.include?(temp)
    			include = true
    			idx0 = idx
  			end
  		end
      if include
        ans[idx0][1] << pros[idx]
      else
        ans << [temp]
  			ans.last << []
  			ans.last.last << pros[idx]
      end
    end
  end
  ans.each do |line|
    line[0] = [line[0]]
  end
  ans.sort
end
