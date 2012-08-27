require 'rake/gempackagetask'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/contrib/rubyforgepublisher'
require 'rubyforge'

SPEC = Gem::Specification.new do |s|
   s.name               = 'scriptaculous_slider'
   s.version            = '1.0.1'
   s.authors            = ['Nicolas Cavigneaux']
   s.email              = 'nico@bounga.org'
   s.homepage           = 'http://www.bitbucket.org/Bounga/acts_as_nice_url'
   s.rubyforge_project  = %q{slider}
   s.summary            = 'A Ruby on Rails extension to provide provides helpers for the script.aculo.us slider control'
   s.description        = 'This extension is of fork of the original scriptaculous slider plugin which is not maintained anymore. It provides helpers for the script.aculo.us slider control.'
   s.files              = [ "Rakefile", "init.rb", "README", "LICENSE"] +
                          Dir.glob("{bin,javascripts,doc,lib,tasks,test}/**/*")
   s.has_rdoc           = true
   s.extra_rdoc_files   = ['README']
   s.require_paths      = ["lib"]
   s.add_dependency('actionpack')
end

desc 'run unit tests'
task :default => :test

task :gem
Rake::GemPackageTask.new(SPEC) do |pkg|
  pkg.need_zip = true
  pkg.need_tar_bz2 = true
end

desc "Install gem file #{SPEC.name}-#{SPEC.version}.gem"
task :install => [:gem] do
  sh "gem install pkg/#{SPEC.name}-#{SPEC.version}.gem"
end

desc "Publish documentation to RubyForge"
task :publish_doc => [:rdoc] do
  rf = Rake::RubyForgePublisher.new(SPEC.rubyforge_project, 'bounga')
  rf.upload
  puts "Published documentation to RubyForge"
end

desc "Release gem #{SPEC.name}-#{SPEC.version}.gem"
task :release => [:gem, :publish_doc] do
  rf = RubyForge.new.configure
  puts "Logging in"
  rf.login

  puts "Releasing #{SPEC.name} v.#{SPEC.version}"

  files = Dir.glob('pkg/*.{zip,bz2,gem}')
  rf.add_release SPEC.rubyforge_project, SPEC.rubyforge_project, SPEC.version, *files
end

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.title    = 'Scriptaculous Slider'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
