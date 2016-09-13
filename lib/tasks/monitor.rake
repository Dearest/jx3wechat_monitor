namespace :monitor do
  desc "监控剑网3微信公众号的推送"
  task jx3: :environment do
    total = 1*60*90
    (1..total).each do
      runner
      sleep 28
    end
  end

  def runner
    url = 'http://weixin.sogou.com/weixin?type=1&query=%E5%89%91%E7%BD%913&ie=utf8&_sug_=n&_sug_type_='
    response = HTTParty.get(url, headers: {"User-Agent" => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.82 Safari/537.36'})
    begin
      content = Nokogiri::HTML(response).css('div.wx-rb')[0].css('span.sp-txt')[2]
    rescue Exception => e
      puts e.message
      sleep 120
      return nil
    end
    title = content.children[0].text
    url = content.css('a')[0]["href"]
    time = Time.at(content.children[1].text.split("'")[1].to_i).to_datetime

    if !PushLog.exists?(title: title)
      PushLog.create(title: title, url: url, time: time)
      get_active_code(url) if title.include?('内藏福利')
      Log.create(title: title, status: :passed)
    else
      Log.create(title: title, status: :unpass)
    end
  end

  def get_active_code(url)

  end
end
