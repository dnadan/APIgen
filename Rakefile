desc "Package with bundler"
task :bundle do
  sh 'bundle pack'
end

desc "Push to cloud foundry"
task :push => :bundle do
  sh 'HTTP_PROXY="http://proxy:8080" cf t -o hybris-prod -s IoT'
  sh 'HTTP_PROXY="http://proxy:8080" cf push -f manifest.yml'
end