require 'json'

# Read data from JSON file
data_hash = JSON.parse(File.read('./_data/services.json'))

# Create the _services directory if it doesn't exist
Dir.mkdir('_services') unless File.directory?('_services')

data_hash.each_with_index do |service, i|
  host = service['host']
  name = service['name']
  doc = service['doc']

  # Find image file (PNG or SVG)
  img = Dir.glob("assets/img/services/#{host}.{png,svg}").first

  # Determine the image path based on availability
  img_path = if img
               "https://passkeys.2stable.com/#{img}"
             else
               ''
             end

  # Create and write the HTML file for the service
  File.open("_services/#{host}.html", 'w') do |f|
    f.puts("---")
    f.puts("layout: bootstrap")
    f.puts("title: Passkeys App for #{name}")
    f.puts("description: How to set up passkeys for your #{name} using Passkeys App")
    f.puts("index: #{i}")
    f.puts("tags: 'passkeys security'")
    f.puts("service-name: #{name}")
    f.puts("image:")
    f.puts("  path: #{img_path}")
    f.puts("  alt: Passkeys App for #{name}")
    f.puts("---")
    f.puts("<div class='container'>{% include service.html %}</div>")
  end
end