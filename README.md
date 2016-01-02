# finance-ytd
Get the year-to-date change for assets in your portfolio, instead of the daily change.

Most financial websites show the daily change of assets. The purpose of this gem is to provide year-to-date change.  Markets, ETFs, mutual funds, and Bitcoin are supported via money.cnn.  Treasuries are supported via bloomberg.com.  Precious metals are supported using apmex.com, but require users to pass in last year's ending price.

# Installation
```ruby
gem install finance-ytd
```

# Usage
```ruby
require 'finance-ytd'

puts CnnFinanceYtd.new({ :symbol => 'VT', :friendly_name => 'World Stocks', :decimal_places => 0 }).to_s
puts ApmexGoldFinanceYtd.new({ :symbol => 'Gold Spot', :friendly_name => 'Gold', :decimal_places => 0, :price_last_year => 1061.70 }).to_s
puts ApmexSilverFinanceYtd.new({ :symbol => 'Silver Spot', :friendly_name => 'Silver', :decimal_places => 0, :price_last_year => 13.82 }).to_s
```
