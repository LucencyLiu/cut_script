#!/bin/bash
#
# �Ƚ�Ŀ¼ DIR �� REF �е��ļ��������ڽṹ������ͬ������Ŀ¼
# �ֱ��г� DIR Ŀ¼����� REF Ŀ¼�ġ���ͬ���ı�����С����ļ����б�
# ֻ�Ƚ϶�����ȡ�Ķ��ԵĶ���
# �����Ĳ������԰����õĽ���ٶ�
# ·���ɿ�ͷ���ֲ�ͬ�Ĳ��ֺͿ����й�ͬ�Ĳ��������
# RLD ��ͷ���ֿ���·����ͬ�Ĳ���
# COM ·���й�ͬ�Ĳ���

NM=privp.dic
RLD=chroot_2/etc
RLR=chroot-3/etc
COM=

if [ "$COM" = "" ]; then
	DIR=$RLD
	REF=$RLR
else
	DIR=$RLD/$COM
	REF=$RLR/$COM
fi

find $DIR -print | sed -e "s|^${DIR}/||" > ttmm1
find $DIR -type d -print | sed -e "s|^${DIR}/||" | ztransed ttmm1 - -v > ttmm2

find $REF -print | sed -e "s|^${REF}/||" > ttmm3
find $REF -type d -print | sed -e "s|^${REF}/||" | ztransed ttmm3 - -v > ttmm4
> kkk1
> kkk2
ztransed ttmm2 ttmm4 -r ttmm5 | while read line; do
#	echo $line
        if [ ! -d $DIR/$line -a ! -d $REF/$line ]; then
	        diff $DIR/$line $REF/$line > /dev/null
		if [ "$?" = "0" ]; then
			echo rm -rf $DIR/$line >> kkk1
		else
			echo $DIR/$line >> kkk2
		fi
	elif [ ! -d $DIR/$line -a -d $REF/$line ]; then
		echo ====$DIR/$line >> kkk2
	fi
done
if [ ! -s kkk1 ]; then
	rm kkk1
#	echo "����� REF Ŀ¼���ԣ�DIR Ŀ¼��û��ͬ������ͬ���ļ�"
else
	echo "kkk1 $DIR Ŀ¼���� $REF Ŀ¼��ͬ������ͬ���ļ���"
fi
if [ ! -s kkk2 ]; then
	rm kkk2
#	echo "����� REF Ŀ¼���ԣ�DIR Ŀ¼��û��ͬ���Ҳ���ͬ���ļ�"
else
	echo "kkk2 $DIR Ŀ¼���� $REF Ŀ¼��ͬ��������ͬ���ļ���"
fi
if [ -s ttmm5 ]; then
	sed -e "s|^|$DIR/|" ttmm5 > kkk3
	echo "kkk3 $DIR Ŀ¼�����е��ļ���"
fi
rm ttmm1 ttmm2 ttmm3 ttmm4 ttmm5
exit
