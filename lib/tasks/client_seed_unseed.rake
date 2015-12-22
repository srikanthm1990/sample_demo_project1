namespace :client do |variable|
    desc "seeds client data"
    
    task :seed => :environment do
         for i in 0..100
             @client = Client.create(name:"name#{i}")
             puts @client.name
             end
         end
     end