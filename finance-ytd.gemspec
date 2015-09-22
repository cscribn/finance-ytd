Gem::Specification.new do |s|
  s.name        = 'finance-ytd'
  s.version     = '0.1.3'
  s.date        = '2015-09-21'
  s.summary     = 'Get the year-to-date change for assets in your portfolio, instead of the daily change.'
  s.description = 'Most financial websites show the daily change of assets. The purpose of this gem is to provide year-to-date change.  ETFs, mutual funds, and Bitcoin are supported via money.cnn.  Precious metals are supported using apmex.com, but require users to pass in last year\'s ending price.'
  s.authors     = ['cscribn']
  s.files       = ['lib/finance-ytd.rb', 'test/test-finance-ytd.rb']
  s.homepage    =
    'http://rubygems.org/gems/finance-ytd'
  s.license       = 'MIT'
end