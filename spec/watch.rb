# A simple alternative to autotest that isnt as painful

options = {
  :options => "--require '#{File.expand_path(File.dirname(__FILE__)) + "/spec_helper"}' --format nested --color",
  :binary => "spec"
}

watch("(lib|spec)/(.*)\.rb") do |match|
  puts %x[ clear ]
  
  file   = match[match.size - 1]
  opts   = options[:options]
  binary = options[:binary]
  
  files = []
  
  ["spec/lib/*.rb", "spec/lib/*/*.rb"].each do |glob|
    Dir.glob(glob).each { |f| files << f }
  end
  
  puts "Found:"
  files.each { |f| puts "+ #{f}" }
  puts ""
  command = "#{binary} #{files.collect! { |f| File.expand_path(f) }.join(" ")} #{opts}"
  
  system(command)
  
end
