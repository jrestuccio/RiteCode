namespace :user_delete do
  desc "TODO"
  task cleanup: :environment do
  	User.where("created_at < ?", 1.minute.ago).destroy_all
  end
end
