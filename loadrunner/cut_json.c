# ����ӿ� post��������ֵ body �к���json ��ʽ��

Action()
{
    int httpRetCode;

	web_reg_save_param("code",
		"LB=\"code\":",
		"RB=,",
		"Search=Body",
		LAST);

	lr_start_transaction("corp_v2_customerEarlyWarning_get");
	web_custom_request("corp_v2_customerEarlyWarning_get",
		"URL=https://corp.dinghuo123.com/v2/customerEarlyWarning/get",
        	"Method=POST",
		"RecContentType=application/json",
		"Resource=0",
		"Referer=",
      		 "EncType=application/json",
		"Mode=HTTP",
		"Body={\"currentPage\":1,\"pageSize\":20,\"departmentId\":\"\",\"customerId\":\"\",\"customerTypeId\":\"\",\"type\":3,\"module\":\"orderCountRingRatioDrop\",\"day\":60,\"percent\":0.3}",
		LAST);
	httpRetCode = web_get_int_property(HTTP_INFO_RETURN_CODE);
	if(httpRetCode == 200 && strcmp(lr_eval_string("{code}"), "200") == 0)
		lr_end_transaction("corp_v2_customerEarlyWarning_get", LR_PASS);
	else
		lr_end_transaction("corp_v2_customerEarlyWarning_get", LR_FAIL);

	return 0;
}

# �ص㣺
# 1��json��ʽ��Ϊbodyһ����ʱ����������post���� "Method=POST",
# 2��web_custom_request �м��� "RecContentType=application/json","EncType=application/json",
# 3��body json ������Ҫ�� " ����ת�� \" ��{: ,����ת��