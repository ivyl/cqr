require 'cqr'

module CQR
  module OTP
    class Builder
      VALID_TYPES  = [ "hotp", "totp" ].freeze
      VALID_DIGITS = [ 6, 8, nil ].freeze
      VALID_PERIOD = [ 30, 60, nil ].freeze

      attr_accessor :secret, :label, :issuer, :type, :digits, :counter, :period

      def to_qr
        QRFormatter.new(url)
      end

      def to_s
        url
      end

      private

      def build_type
        raise CQRException.new("unknown type") unless VALID_TYPES.member?(type)
        type
      end

      def build_digits
        raise CQRException.new("wrong number of digits") unless VALID_DIGITS.member?(digits)
        digits ? "&digits=#{digits}" : ""
      end

      def build_period
        raise CQRException.new("wrong period") unless VALID_PERIOD.member?(period)
        abort "period wit hotp" if period && type == "hotp"
        period ? "&period=#{period}" : ""
      end

      def build_digits
        digits ? "&digits=#{digits}" : ""
      end

      def build_issuer
        issuer ? "&issuer=#{issuer}" : ""
      end

      def build_counter
        raise CQRException.new("counter with non-hotp") if counter && type != "hotp"
        counter ? "&counter=#{counter}" : ""
      end

      def url
        "otpauth://#{build_type}/#{label}?secret=#{secret}#{build_digits}" +
        "#{build_period}#{build_counter}#{build_issuer}"
      end
    end
  end
end
