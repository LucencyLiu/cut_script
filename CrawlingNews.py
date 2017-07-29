# -*- coding:utf-8 -*-
import  urllib2

totalpage = 15
url = 'http://news.baidu.com/'
for num in range(1,totalpage):
    half_url = u'ns?tn=news&from=news&cl=2&rn=20&ct=1&word=千米网&pn=%s'%((num-1)*20)
    #构造get请求
    req = urllib2.Request(url+half_url.encode('utf-8'))
    #添加header
    req.add_header('User-Agent','Mozilla/5.0')
    req.add_header('Referer',url)
    response = urllib2.urlopen(req)
    newsresponse = response.read()
    filename = "qmw%s.html" %num
    totxt = open(filename,'w')
    totxt.write(newsresponse)
    totxt.close()
