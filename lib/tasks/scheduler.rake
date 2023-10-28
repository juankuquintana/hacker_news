task :sync_hacker_news => :environment do
  TopStoriesSyncJob.perform_async
end