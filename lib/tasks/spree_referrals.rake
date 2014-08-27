namespace :spree_referrals do
  task :users_install => :environment do
    Spree.user_class.all.each do |user|
      if user.referral.nil?
        user.create_referral.save
      end
    end
    puts "Spree Referrals Installed."
  end
end
