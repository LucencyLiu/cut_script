import requests

class Login():
    #def __init__(self):
        #self.session = requests.se



    def login(self, tenant, password):
        #s = self.session
        url = 'https://test-pc.dinghuo123.com/jwtToken'
        headers = {'X-Requested-With':'XMLHttpRequest', 'Content-Type':'application/json'}
        data = {'userName' : tenant, 'password' : password}
        #r = s.post(url, headers = headers, json=data)
        r = requests.post(url, headers = headers, json=data)
        # 问题1、request方法出错，入参是json格式，却使用了data --> r = requests.post(url, headers=headers, data=data)
        # 问题2、不能使用json.dumps方法，被直接蠢哭, 自己定义了变量名称是json --》 json = {'userName':tenant,'password':password}
        rdata = r.json()
        jwtToken = rdata['data']['jwtToken']
        #print(jwtToken)
        return jwtToken

if __name__ == '__main__' :
    lvt = Login()
    jwt = lvt.login('18510615120','123456')
    print(jwt)