# 有几个就加几个
web_add_header("Content-Type","application/json");

# 带变量
web_add_header("Authorization","{jwtToken}");  