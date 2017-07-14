def taskMaker(source, challengeId)
    to_nil = []
    source = source.map.with_index do |line, idx|
        if line.scan("//DB").empty?
            line
        else
            line = line.split("//")
            if line[1].scan(/\d+/)[0].to_i == challengeId
                to_nil << idx - 1 if idx > 0
                line[0] + line[2]
            end
        end
    end
    to_nil.each do |idx|
        until idx.zero?
            if source[idx].nil?
                idx -= 1
            else
                source[idx] = nil
                break
            end
        end
    end
    source.compact
end
