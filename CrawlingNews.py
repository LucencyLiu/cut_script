# -*- coding:utf-8 -*-
import  urllib2

#pagenum = pn 20 40 60 80 100 120
url = 'http://news.baidu.com/'
# 关键词 
keyword ='六度人和'

for num in range(1,18):
    half_url = u'ns?tn=news&from=news&cl=2&rn=20&ct=1&word=六度人和&pn=%s'%((num-1)*20)

    #构造get请求
    req = urllib2.Request(url+half_url.encode('utf-8'))
    #添加header
    req.add_header('User-Agent','Mozilla/5.0')
    req.add_header('Referer',url)
    response = urllib2.urlopen(req)
    newsresponse = response.read()

    totxt = open(keyword,'ab+')
    totxt.write(newsresponse)
    totxt.close()

#数据分析
#热新闻过滤：关键字，时间，媒体，标题，相同新闻数
#u"年"==4
