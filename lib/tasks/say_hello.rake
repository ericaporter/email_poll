desc "Says hello"
namespace :db do
  task :say_hello, [:filename] => :environment do
    puts 'Hello'
    #put code here that doesn't belong direclty in your application for tasks like housecleaning, etc
  end
end
