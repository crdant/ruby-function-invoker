require "base64"

Proc.new { |text| Base64.encode64(text) }
