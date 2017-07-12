def incrementalBackups(backup, changes)
    updates = []
    changes.each do |change|
        updates << change.last if change.first > backup
    end
    updates.uniq.sort
end