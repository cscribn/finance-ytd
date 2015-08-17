require 'minitest/autorun'
require 'finance-ytd'

class FinanceYtdTest < Minitest::Test
	def test_
		cnn_etf_tests = []
		cnn_etf_tests.push({ :symbol => 'VT', :friendly_name => 'World Stocks', :decimal_places => 0 })
		cnn_etf_tests.push({ :symbol => 'VTI', :friendly_name => 'U.S Stocks', :decimal_places => 0 })
		cnn_etf_tests.push({ :symbol => 'VXUS', :friendly_name => 'Foreign Stocks', :decimal_places => 0 })
		cnn_etf_tests.push({ :symbol => 'BWZ', :friendly_name => 'Foreign Cash', :decimal_places => 0 })
		
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