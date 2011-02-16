require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "formative"
  gem.homepage = "http://github.com/martinrehfeld/formative"
  gem.license = "MIT"
  gem.summary = %Q{Simple yet useful form builder for Rails 2 and 3}
  gem.description = %Q{Formative is an extraction of the custom form builder I used in my last couple of Rails projects. It is the simplest thing that could possibly work for me. YMMV.}
  gem.email = "martin.rehfeld@glnetworks.de"
  gem.authors = ["Martin Rehfeld"]
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new
