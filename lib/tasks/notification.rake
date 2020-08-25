namespace :notification do
    task notification: :environment do
        User.all.each do |user|
          NotificationMailer.test(user.email).deliver
        end
    end
  end