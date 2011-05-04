# Rakefile
require "rake/clean"

sources = Hash.new
home = File.expand_path '~'

files = Dir.entries(Dir.getwd)
files.reject! {|f| f.start_with?('.')}
files.reject! {|f| f =~ /^[A-Z]/ }
files.each do |f|
	src = File.join Dir.getwd, f
	dst = File.join home, ".#{f}"
	sources[src] = dst

	CLEAN << dst
	puts "#{src} -> #{dst}"
end

puts "---"
p sources

desc "Defaults to noop"
task :default do |t|

end
desc "Install configuration files"
task :install do |t|
	sources.each do |src, dst|
		FileUtils.symlink(src, dst, :force => true)
	end
end

