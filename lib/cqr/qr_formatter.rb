require 'rqrcode'

module CQR
  class QRFormatter
    attr_accessor :invert, :margin
    alias_method :invert?, :invert

    def initialize(string, margin = 0, invert = true)
      self.margin = margin
      self.invert = invert
      create_qr_code(string)
    end

    def to_s
      lines = []

      lines << horizontal_margin

      qrstring.lines.map do |line|
        lines << "#{prefix}#{vertical_margin}#{line.chomp}#{vertical_margin}"
      end

      lines << horizontal_margin

      lines.join "\n"
    end

    private

    def qrstring
      @qrstring ||= @qrcode.to_s(true: "\u2588", false: " ")
    end

    def vertical_margin
      " " * margin
    end

    def horizontal_margin
      width = qrstring.lines.first.chomp.size
      lines = margin.times.map{ "#{prefix}#{" "*(width+2*margin)}" }
      lines.join "\n"
    end

    def create_qr_code(string)
      size = 1
      begin
        @qrcode = RQRCode::QRCode.new(string, size: size)
      rescue RQRCode::QRCodeRunTimeError
        size += 1
        retry
      end
    end

    def prefix
      prefix = (invert? ? "\e[7m" : "")
    end

  end
end
