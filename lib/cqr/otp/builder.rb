require 'cqr'

module CQR
  module OTP
    class Builder
      def initialize(secret, name)
        @url = "otpauth://totp/#{name}?secret=#{secret}"
      end

      def to_qr
        QRFormatter.new(@url, 5)
      end
    end
  end
end
