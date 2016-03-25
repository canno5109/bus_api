class SystemController < ApplicationController
  def index
    @version = "1.0"
    @date = DateTime.now.strftime('%Y-%m-%d %H-%M')
  end

  def ride
    require 'open-uri'
    require 'openssl'
    require 'nokogiri'

    # スクレイピング対象のページ
    url = 'http://gps.iwatebus.or.jp/bls/pc/jyosha.jsp'
    # 指定したサイトの解析開始
    doc = Nokogiri::HTML(open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read)
    busStops = []
    doc.css('td[bgcolor="#F0F0F0"]').each do |node|
      for var in node.css('a') do
        bus_stop_name = var.text
        bus_url = var['href']
        # 出力
        puts bus_stop_name + "\t" + bus_url 

        bus_info = {
          "bus_stop_name": var.text,
          "bus_stop_url": var['href']
        }
        busStops.push(bus_info)
      end
    end
    @busStops = busStops
  end

  def getting_off
    require 'open-uri'
    require 'openssl'
    require 'nokogiri'

    url = params[:url]
    #url = 'http://gps.iwatebus.or.jp/bls/pc/kosha.jsp?jjg=1&jtr=339'
    doc = Nokogiri::HTML(open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read)
    busStops = []
    doc.css('td[bgcolor="#F0F0F0"]').each do |node|
      for var in node.css('a') do
        bus_stop_name = var.text
        bus_url = var['href']
        # 出力
        puts bus_stop_name + "\t" + bus_url 

        bus_info = {
          "bus_stop_name": var.text,
          "bus_stop_url": var['href']
        }
        busStops.push(bus_info)
      end
    end
    @busStops = busStops
  end

  def weekday
    require 'open-uri'
    require 'openssl'
    require 'nokogiri'

    url = params[:url]
    #url = 'http://gps.iwatebus.or.jp/bls/pc/jikoku_jk.jsp?jjg=1&jtr=250&kjg=2&ktr=1025&ty=1'
    doc = Nokogiri::HTML(open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read)

    hours = []
    doc.css('td[class="dya-hour"]').each do |node|
      hour = node.css('div > strong').text
      hours.push(hour)
    end

    times1 = []
    doc.css('td[class="dya-min-even"]').each do |node|
      time1 = node.text.to_s
      times1.push(time1)
    end

    times2 = []
    doc.css('td[class="dya-min-odd"]').each do |node|
      time2 = node.text.to_s
      times2.push(time2)
    end

    times = []
    for num in 0..9 do
      times.push(times1[num])
      times.push(times2[num])
    end

    weekdays = []
    for num in 0..20 do
      weekdayInfo = {
        "hour": hours[num],
        "times": times[num]
      }
      weekdays.push(weekdayInfo)
    end

    @weekdays = weekdays
  end

  def holiday
    require 'open-uri'
    require 'openssl'
    require 'nokogiri'

    url = params[:url]
    #url = 'http://gps.iwatebus.or.jp/bls/pc/jikoku_jk.jsp?jjg=1&jtr=250&kjg=2&ktr=1025&ty=1'
    doc = Nokogiri::HTML(open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read)

    hours = []
    doc.css('td[class="dya-hour"]').each do |node|
      hour = node.css('div > strong').text
      hours.push(hour)
    end

    times1 = []
    doc.css('td[class="dya-min-even"]').each do |node|
      time1 = node.text.to_s
      times1.push(time1)
    end

    times2 = []
    doc.css('td[class="dya-min-odd"]').each do |node|
      time2 = node.text.to_s
      times2.push(time2)
    end

    times = []
    for num in 0..9 do
      times.push(times1[num])
      times.push(times2[num])
    end

    weekdays = []
    for num in 0..20 do
      weekdayInfo = {
        "hour": hours[num],
        "times": times[num]
      }
      weekdays.push(weekdayInfo)
    end

    @holidays = weekdays
  end

  def saturday
    require 'open-uri'
    require 'openssl'
    require 'nokogiri'

    url = params[:url]
    #url = 'http://gps.iwatebus.or.jp/bls/pc/jikoku_jk.jsp?jjg=1&jtr=250&kjg=2&ktr=1025&ty=1'
    doc = Nokogiri::HTML(open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read)

    hours = []
    doc.css('td[class="dya-hour"]').each do |node|
      hour = node.css('div > strong').text
      hours.push(hour)
    end

    times1 = []
    doc.css('td[class="dya-min-even"]').each do |node|
      time1 = node.text.to_s
      times1.push(time1)
    end

    times2 = []
    doc.css('td[class="dya-min-odd"]').each do |node|
      time2 = node.text.to_s
      times2.push(time2)
    end

    times = []
    for num in 0..9 do
      times.push(times1[num])
      times.push(times2[num])
    end

    weekdays = []
    for num in 0..20 do
      weekdayInfo = {
        "hour": hours[num],
        "times": times[num]
      }
      weekdays.push(weekdayInfo)
    end

    @saturdays = weekdays
  end

  def get_time_table
  end
end
