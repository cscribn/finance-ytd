require 'minitest/autorun'
require_relative '../lib/finance-ytd'

class FinanceYtdTest < Minitest::Test
    def testCnnFinanceYtd(symbol, friendly_name, decimal_places)
        f = CnnFinanceYtd.new({ :symbol => symbol, :friendly_name => friendly_name, :decimal_places => decimal_places })
        puts f
        assert f.ytd_return.is_a? Float
    end

    def test_
        testCnnFinanceYtd('VT', 'World Stocks', 0)
        f = ApmexGoldFinanceYtd.new({ :symbol => 'Gold Spot', :friendly_name => 'Gold', :decimal_places => 0, :price_last_year => 1151.60 }) # apmex bid price on 1/1/17
        puts f
        assert f.ytd_return.is_a? Float
        f = ApmexSilverFinanceYtd.new({ :symbol => 'Silver Spot', :friendly_name => 'Silver', :decimal_places => 0, :price_last_year => 15.88 }) # apmex bid price on 1/1/17
        puts f
        assert f.ytd_return.is_a? Float
        puts

        testCnnFinanceYtd('VTI', 'U.S. Stocks', 0)
        testCnnFinanceYtd('VXUS', 'Foreign Stocks', 0)
        puts

        testCnnFinanceYtd('VGLT', 'Long-Term Gov', 0)
        f = BloombergFinanceYtd.new({ :symbol => 'USGG10YR:IND', :friendly_name => '10 Year', :decimal_places => 0 })
        puts f
        assert f.ytd_return.is_a? Float
        puts

        testCnnFinanceYtd('BWZ', 'Foreign Cash', 0)
        puts
    end
end