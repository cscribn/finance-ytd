require 'rubygems'
require 'nokogiri'
require 'open-uri'

class String
	def bg_red;         "\033[41m#{self}\033[0m" end
	def bg_green;       "\033[42m#{self}\033[0m" end
end

class FinanceYtd
	attr_accessor :css, :url, :symbol, :friendly_name, :css_text, :ytd_return
	
	def initialize(options)
		@symbol = options[:symbol]
		@friendly_name = options[:friendly_name]
		@decimal_places = options[:decimal_places]
		@price_last_year = options[:price_last_year]
	end

	def match
		page = Nokogiri::HTML(open(@url))
		@css_text = page.css(@css).text
	end
	
	def calculate
		@ytd_return = @css_text.tr('+%', '').to_f / 100.0
	end
	
	def to_s
		s = @friendly_name + ' (' + @symbol + ') ' + (@ytd_return * 100.0).round(@decimal_places).to_s + '%'

		if @ytd_return >= 0.0
			s.bg_green
		else
			s.bg_red
		end		
	end
end

class CnnEtfFinanceYtd < FinanceYtd
	def initialize(options)
		super(options)
		@css = 'td.wsod_ytd > span'
		@url = 'http://money.cnn.com/quote/etf/etf.html?exHours=off&symb=' + @symbol
		match()
		calculate()
	end
end

class ApmexGoldFinanceYtd < FinanceYtd
	def initialize(options)
		super(options)
		@css = 'table.table-spot-prices > tbody > tr:nth-child(1) > td:nth-child(2) > span'
		@url = 'http://www.apmex.com'
		match()
		calculate()
	end

	def match
		super
		css_text_match = /(\d*,*\d+\.\d+)/.match(@css_text)
		@price_this_year = css_text_match[1].gsub(',', '').to_f
	end
	
	def calculate
		@ytd_return = @price_this_year / @price_last_year - 1.0
	end
end

class ApmexSilverFinanceYtd < FinanceYtd
	def initialize(options)
		super(options)
		@css = 'table.table-spot-prices > tbody > tr:nth-child(2) > td:nth-child(2) > span'
		@url = 'http://www.apmex.com'
		match()
		calculate()
	end

	def match
		super
		css_text_match = /(\d*,*\d+\.\d+)/.match(@css_text)
		@price_this_year = css_text_match[1].gsub(',', '').to_f
	end
	
	def calculate
		@ytd_return = @price_this_year / @price_last_year - 1.0
	end
end