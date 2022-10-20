class BuildRequestUrl
  def self.call(method:, value: RequestSetting.find_by!(key: "url").value)
    data = {}

    value.scan(RequestSetting::VAR_PATTERN).flatten.each do |k|

      setting = RequestSetting.find_by(key: k)

      result = if k == "method"
        method
      elsif setting.interpolated?
        call(value: setting.value, method: method)
      else
        setting.value
      end

      data[k] = result
    end

    data.each { |k, v| value.gsub!("{#{k}}", v) }
    value
  end
end
