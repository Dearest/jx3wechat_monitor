namespace :agent do
  desc '获取西刺代理的代理ip，缓存在redis'
  task xici: :environment do
    $redis.sadd(:proxies, get_proxy_list)
    $redis.expire(:proxies, 60*60*3)
  end

  def get_proxy_list
    proxies = []
    (1..2).each do |page|
      proxies += get_url('nt', page) #国内透明
    end
    proxies
  end

  def get_url(type, page)
    proxies = []
    doc = Nokogiri::HTML(HTTP.get("http://www.xicidaili.com/#{type}/#{page.to_s}").to_s)
    doc.css("//div//table//tr").each do |item|
      next if item.elements[6].children[1].nil?
      next if item.elements[6].children[1].attributes['title'].value.gsub('秒', '').to_f > 0.5
      next if item.elements[8].children[0].text.include?('小时') && item.elements[8].children[0].text.gsub('小时', '').to_i < 20
      proxies << "#{item.elements[1].children.text}:#{item.elements[2].children.text}" if check_proxy(item.elements[1].children.text, item.elements[2].children.text.to_i)
    end
    proxies
  end

  def check_proxy(ip, port)
    begin
      HTTP.via(ip, port).timeout({connect: 6, read: 6}).get('http://weixin.sogou.com/').code == 200
    rescue
      false
    end
  end
end

# def get_proxy
#   unless $redis.exists(:proxies) && $redis.scard(:proxies) != 0
#     $redis.sadd(:proxies,self.class.get_proxy_list)
#     $redis.expire(:proxies, 60*60*2)
#   end
#   $redis.srandmember(:proxies).split(':')
# end
