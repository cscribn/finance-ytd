Gem::Specification.new do |s|
  s.name        = 'finance-ytd'
  s.version     = '1.0.2'
  s.date        = '2015-12-07'
  s.summary     = 'Get the year-to-date change for assets in your portfolio, instead of the daily change.'
  s.description = 'Most financial websites show the daily change of assets. The purpose of this gem is to provide year-to-date change.  Markets, ETFs, mutual funds, and Bitcoin are supported via money.cnn.  Treasuries are supported via bloomberg.com.  Precious metals are supported using apmex.com, but require users to pass in last year\'s ending price.'
  s.authors     = ['cscribn']
  s.files       = ['lib/finance-ytd.rb', 'test/test-finance-ytd.rb']
  s.homepage    =
    'http://rubygems.org/gems/finance-ytd'
  s.license       = 'MIT'
	s.add_development_dependency 'minitest', '~> 0'
	s.add_runtime_dependency 'nokogiri', '~> 0'
end