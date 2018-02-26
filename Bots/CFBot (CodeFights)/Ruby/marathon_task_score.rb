def marathonTaskScore(length, max, submissions, submission_time)
  return 0 if submission_time < 0
  [max - ((submissions - 1) * 10) - (submission_time * ((max / 2) * (1 / length.to_f))), max / 2].max
end
