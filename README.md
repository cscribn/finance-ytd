# finance-ytd
Get year-to-date return information on various financial assets.

# Installation
<pre>gem install finance-ytd</pre>

# Usage
<pre>require 'finance-ytd'</pre>

# Examples
<pre>
  >> CnnEtfFinanceYtd.new({
  >>   :symbol => 'VT', 
  >>   :friendly_name => 'World Stocks',
  >>   :decimal_places => 0
  >> }).to_s
  => World Stocks (VT) 5%

  >> ApmexGoldFinanceYtd.new({
  >>   :symbol => 'Gold Spot',
  >>   :friendly_name => 'Gold',
  >>   :decimal_places => 0,
  >>   :price_last_year => 1183.90
  >> }).to_s
  => Gold (Gold Spot) -1%

  >> ApmexSilverFinanceYtd.new({
  >>   :symbol => 'Silver Spot',
  >>   :friendly_name => 'Silver',
  >>   :decimal_places => 0,
  >>   :price_last_year => 15.56
  >> }).to_s
  => Silver (Silver Spot) 1%
</pre>
