# 리스트 슬라이싱
rainbow = ['빨강', '주황', '노랑', '초록', '파랑', '남색', '보라', 1]
print('\n무지개색깔 \t :', rainbow)

test = rainbow[-1] - 1
print(test)

result = rainbow[2:5]
print('rainbow[2:5] :', result)

result = rainbow[:3]
print('rainbow[ :3] :', result)

result = rainbow[:]
print('rainbow[ : ] :', result)

result = rainbow[::2]
print('rainbow[::2] :', result)

result = rainbow[-3:]
print('rainbow[-3:] :', result)

result = rainbow[::-1]
print('rainbow[::-1]:', result)