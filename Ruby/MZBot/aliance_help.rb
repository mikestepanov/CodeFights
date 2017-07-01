def alliance_help(time, aliance_size)
  aliance_size = 10 if aliance_size > 10
  ten_percent = time / 10
  max_help = [60, ten_percent].max
  time = time - max_help * aliance_size
  time <= 0 ? 0 : time
end
