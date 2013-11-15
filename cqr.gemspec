Gem::Specification.new do |s|
  s.name          = "cqr"
  s.version       = "0.0.1"
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Arkadiusz Hiler"]
  s.email         = ["arkadiusz@hiler.pl"]
  s.homepage      = "https://github.com/ivyl/cqr"
  s.summary       = "Command-line QR Code tool."
  s.description   = "CQR is comman-line tool for creating and displaying QR Codes."

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "rqrcode", "~> 0.4.2"
  s.add_dependency "base32", "~> 0.2.0"


  s.require_path = "lib"
  s.files = Dir["lib/**/*"]

  s.executables = [ 'cqr', 'qrotp' ]
end
