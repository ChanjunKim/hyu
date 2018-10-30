flag = True
while flag:
    try:
        num = int(input('숫자를 입력해주세요[1-100] : '))
        if num > 100 :
            print('입력값이 너무 큽니다.')
            continue
        flag = False
    except :
        print('숫자가 아닙니다.')
        continue

print('입력한 숫자는 ', num, '입니다.')
print('-'*20)

sum = 0
for i in range(num+1):
    sum = i + sum

print(num,'까지의 합은 ', sum, '입니다.')
print('-'*20)
print('아래는 팩토리얼 테이블입니다.')

factorial_list = []
for i in range(num+1):
    factorial = 1
    for j in range(i+1):
        factorial = 1*(j+1)*factorial
    factorial_list.append(factorial)

for x in range(num):
    print(str(x+1)+ '!\t= ', factorial_list[x])