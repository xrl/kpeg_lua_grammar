require 'rubygems'
require 'bundler/setup'
require 'rake/testtask'

task :default => :test

file "lib/grammar.kpeg.rb" => ["lib/grammar.kpeg"] do
  Dir.chdir "lib" do
    system "rm grammar.kpeg.rb"
    system "kpeg grammar.kpeg"
  end
end

task :clean do
  Dir["lib/*.rbc", "lib/**/*.rbc"].each{|file| sh "rm -f #{file}"}
  Dir["test/*.rbc", "test/**/*.rbc"].each{|file| sh "rm -f #{file}"}
end

Rake::TestTask.new(:test => ["lib/grammar.kpeg.rb"]) do |t|
  t.test_files = FileList["test/*_test.rb"]
end
