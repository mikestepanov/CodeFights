def companyBotStrategy(trainingData)
  data = trainingData.map{|arr| arr[0] if arr[1] == 1}.compact
  return 0 if data.empty?
  (data.inject(0, :+) / data.size.to_f)
end
