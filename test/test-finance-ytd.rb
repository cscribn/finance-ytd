require 'minitest/autorun'
require_relative '../lib/finance-ytd'

class FinanceYtdTest < Minitest::Test
	def testCnnEtfFinanceYtd(symbol, friendly_name, decimal_places)
		f = CnnEtfFinanceYtd.new({ :symbol => symbol, :friendly_name => friendly_name, :decimal_places => decimal_places })
		puts f
		assert f.ytd_return.is_a? Float
	end

	def testCnnMarketFinanceYtd(symbol, friendly_name, decimal_places)
		f = CnnMarketFinanceYtd.new({ :symbol => symbol, :friendly_name => friendly_name, :decimal_places => decimal_places })
		puts f
		assert f.ytd_return.is_a? Float
	end

	def test_
		testCnnEtfFinanceYtd('VT', 'World Stocks', 0)

		f = ApmexGoldFinanceYtd.new({ :symbol => 'Gold Spot', :friendly_name => 'Gold', :decimal_places => 0, :price_last_year => 1183.90 })
		puts f
		assert f.ytd_return.is_a? Float
		f = ApmexSilverFinanceYtd.new({ :symbol => 'Silver Spot', :friendly_name => 'Silver', :decimal_places => 0, :price_last_year => 15.56 })
		puts f
		assert f.ytd_return.is_a? Float
		puts

		testCnnEtfFinanceYtd('VTI', 'U.S. Stocks', 0)
		testCnnEtfFinanceYtd('VXUS', 'Foreign Stocks', 0)
		testCnnEtfFinanceYtd('SGDM', 'Gold Miners', 0)
		testCnnEtfFinanceYtd('BWZ', 'Foreign Cash', 0)
		testCnnMarketFinanceYtd('dow', 'Dow', 0)
		testCnnMarketFinanceYtd('sandp', 'S&P 500', 0)
		f = BloombergFinanceYtd.new({ :symbol => 'USGG10YR:IND', :friendly_name => '10 Year', :decimal_places => 0 })
		puts f
		assert f.ytd_return.is_a? Float
		testCnnEtfFinanceYtd('XBT', 'Bitcoin', 0)
		puts
	end
end