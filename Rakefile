require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
	replace_all = false
	Dir['*'].each do |file|
		next if %w[ssh Rakefile README.rdoc LICENSE].include? file
		file_logic(file)  
	end
	Dir['./vim/bundle/*'].each do |file|
		out = `git submodule sync #{file}`
		puts out
		out = `git submodule update --init #{file}`
		puts out
	end
	Dir['./bin/*'].each do |file|
		out = `git submodule sync #{file}`
		puts out
		out = `git submodule update --init #{file}`
		puts out
	end
	Dir['ssh/*'].each do |file|
		file_logic(file)
	end
	Dir['nvm'].each do |file|
		out = `git submodule sync #{file}`
		puts out
		out = `git submodule update --init #{file}`
		puts out
	end
	Dir['js/*'].each do |file|
		file_logic(file)
	end
end
def file_logic(file)
	replace_all = false
	if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
		if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
			puts "identical ~/.#{file.sub('.erb', '')}"
		elsif replace_all
			replace_file(file)
		else
			print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
			case $stdin.gets.chomp
			when 'a'
				replace_all = true
				replace_file(file)
			when 'y'
				replace_file(file)
			when 'q'
				exit
			else
				puts "skipping ~/.#{file.sub('.erb', '')}"
			end
		end
	else
		link_file(file)
	end
end

def replace_file(file)
	system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
	link_file(file)
end

def link_file(file)
	if file =~ /.erb$/
		puts "generating ~/.#{file.sub('.erb', '')}"
		File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
			new_file.write ERB.new(File.read(file)).result(binding)
		end
	else
		puts "linking ~/.#{file}"
		system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
	end
end

