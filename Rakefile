task :default => [:compile]

task :compile => [:clean] do |t|
  system "bundle exec kpeg grammar.kpeg"
end

task :clean do
  system "rm -f grammar.kpeg.rb"
end
