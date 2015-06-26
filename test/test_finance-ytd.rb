require 'minitest/autorun'
require 'finance-ytd'

class FinanceYtdTest < Minitest::Unit::TestCase
	def test
		cnn_etf_tests = []
		cnn_etf_tests.push({ :symbol => 'VT', :friendly_name => 'World Stocks', :decimal_places => 0 })
		cnn_etf_tests.push({ :symbol => 'VTI', :friendly_name => 'U.S Stocks', :decimal_places => 0 })
		cnn_etf_tests.push({ :symbol => 'VXUS', :friendly_name => 'Foreign Stocks', :decimal_places => 0 })
		cnn_etf_tests.push({ :symbol => 'GDX', :friendly_name => 'Gold Miners', :decimal_places => 0 })
		cnn_etf_tests.push({ :symbol => 'BND', :friendly_name => 'U.S. Bonds', :decimal_places => 0 })
		cnn_etf_tests.push({ :symbol => 'IEF', :friendly_name => '10 Year Treasury', :decimal_places => 0 })
		cnn_etf_tests.push({ :symbol => 'BNDX', :friendly_name => 'Foreign Bonds', :decimal_places => 0 })
		cnn_etf_tests.push({ :symbol => 'BWZ', :friendly_name => 'Foreign Cash', :decimal_places => 0 })
		cnn_etf_tests.push({ :symbol => 'XBT', :friendly_name => 'Bitcoin', :decimal_places => 0 })
		
		cnn_etf_tests.each do |c|
			f = CnnEtfFinanceYtd.new(c)
			puts f
			assert f.ytd_return.is_a? Float	
		end
		
		f = ApmexGoldFinanceYtd.new({ :symbol => 'Gold Spot', :friendly_name => 'Gold', :decimal_places => 0, :price_last_year => 1183.90 })
		puts f
		assert f.ytd_return.is_a? Float
		
		f = ApmexSilverFinanceYtd.new({ :symbol => 'Silver Spot', :friendly_name => 'Silver', :decimal_places => 0, :price_last_year => 15.56 })
		puts f
		assert f.ytd_return.is_a? Float		
	end
end