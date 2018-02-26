def shortestSolutionLength(source)
  source = source.map{|line| line.gsub(/\s/, "")}
  total = 0
  multi_comm = false
  source.each do |line|
    (0...line.length).each do |idx|
      if multi_comm == false
        break if line[idx] == "/" && line[idx + 1] == "/"
        if line[idx] == "/" && line[idx + 1] == "*"
          multi_comm = true
        else
          total += 1
        end
      else
        if line[idx] == "*" && line[idx + 1] == "/"
          multi_comm = false
          total -= 1 if line[idx + 2] != "/" && line[idx + 3] != "/"
        end
      end
    end
  end
  total
end
