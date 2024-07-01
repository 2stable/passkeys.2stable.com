require 'json'

# Read the JSON data from the file 'old.json'
file = File.read('buffer.json')
data = JSON.parse(file)

# Transform the data
transformed_data = data.map do |item|
  {
    'name' => item['name'],
    'website' => item['domain_full'],
    'host' => item['domain'],
    'doc' => item['documentation_link'] || item['setup_link']
  }
end

# Sort the data alphabetically by the 'name' field
sorted_data = transformed_data.sort_by { |item| item['name'].downcase }

# Write the sorted and transformed data to 'new.json'
File.open('services.json', 'w') do |f|
  f.write(JSON.pretty_generate(sorted_data))
end
