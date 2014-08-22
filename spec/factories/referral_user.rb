require 'factory_girl'
 
Factory.define :user do |f|
  f.sequence(:user_name){ |n| "fooAPL#{n}" }
  f.password 'ups'
  f.email 'test@autoplenum.de'
end
