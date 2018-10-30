customer = {
    "name"    : "김진수",
    'gender'  : '남자',
    "email"   : "bigpycraft@gmail.com",
    "company" : "빅파이크래프트",
    "address" : "서울시 중구 청파로"
}

print(customer)
print(type(customer))
customer_list = list(customer)
customer_set = set(customer)
print(type(customer_list))
print("customer_list = " , customer_list)
print("customer_set = ", customer_set)
print(customer.keys())
print(type(customer.keys()))
print(customer.values())
print(type(customer.values()))
print(customer.items())
print(type(customer.items()))

for key, value in customer.items():
    print('%s\t : %s' %(key, value))

print('\n')

for k, v in customer.items():
    print('%s\t : %s' % (k, v))