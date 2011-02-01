Given /^Bruna's day$/ do |table|
  table.hashes.each do |day|
    Day.create! :arrival => day['arrival'], :departure => day['departure']
  end
end

