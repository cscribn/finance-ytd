require 'minitest/autorun'
require_relative '../lib/finance-ytd'

class FinanceYtdTest < Minitest::Test
	def testCnnEtfFinanceYtd(symbol, friendly_name, decimal_places)
		f = CnnEtfFinanceYtd.new({ :symbol => symbol, :friendly_name => friendly_name, :decimal_places => decimal_places })
		puts f
		assert f.ytd_return.is_a? Float
	end

	def test_
		testCnnEtfFinanceYtd('VT', 'World Stocks', 0)
		testCnnEtfFinanceYtd('VTI', 'U.S. Stocks', 0)
		testCnnEtfFinanceYtd('VXUS', 'Foreign Stocks', 0)
		puts

		f = ApmexGoldFinanceYtd.new({ :symbol => 'Gold Spot', :friendly_name => 'Gold', :decimal_places => 0, :price_last_year => 1183.90 })
		puts f
		assert f.ytd_return.is_a? Float

		f = ApmexSilverFinanceYtd.new({ :symbol => 'Silver Spot', :friendly_name => 'Silver', :decimal_places => 0, :price_last_year => 15.56 })
		puts f
		assert f.ytd_return.is_a? Float
		puts

		testCnnEtfFinanceYtd('BWZ', 'Foreign Cash', 0)
		testCnnEtfFinanceYtd('SGDM', 'Gold Miners', 0)
		testCnnEtfFinanceYtd('BND', 'U.S. Bonds', 0)
		testCnnEtfFinanceYtd('BNDX', 'Foreign Bonds', 0)
		testCnnEtfFinanceYtd('XBT', 'Bitcoin', 0)
		puts
	end
end