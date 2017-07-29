# -*- coding:utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding("gb18030")

from pyquery import PyQuery as pq
# totalpage = 15
# for num in range(1,totalpage):
# 	htmlfile = "qmw1.html" %num
# 	fromhtml = open(htmlfile, 'r')
# 	doc = pq(filename=htmlfile,parser='html')
# 	fromhtml.close()
# 	for classid in range(1,21):
# 		resultid = '#'+'%d'%classid
# 		authorAndtime = doc(resultid).find('.c-author').text()
# 		title = doc(resultid).find('.c-title').text()
# 		if doc(resultid).find('.c-more_link'):
# 			nums = doc(resultid).find('.c-more_link').text()
# 			nums = nums[0]
# 		else:
# 			nums = '0'
# 		strit = authorAndtime+'\t'+title+'\t'+nums+'\n'
# 		#print (authorAndtime)
# 		txtfile = "qmw%s.txt" %num
# 		totxt = open(txtfile, 'a')
# 		totxt.write(strit)
# 		totxt.close()

htmlfile = "qmw2.html"
fromhtml = open(htmlfile, 'r')
doc = pq(filename=htmlfile,parser='html')
fromhtml.close()
for classid in range(1,21):
	resultid = '#'+'%d'%classid
	authorAndtime = doc(resultid).find('.c-author').text()
	title = doc(resultid).find('.c-title').text()
	if doc(resultid).find('.c-more_link'):
		nums = doc(resultid).find('.c-more_link').text()
		nums = nums[0]
	else:
		nums = '0'
	strit = authorAndtime+'\t'+title+'\t'+nums+'\n'
	#print (authorAndtime)
	txtfile = "qmw.txt"
	totxt = open(txtfile, 'a')
	totxt.write(strit)
	totxt.close()
