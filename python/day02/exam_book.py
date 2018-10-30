books = list()

books.append({'제목' : '파이썬 프로그램', '출판연도' : '2016', '출판사' : 'A', '쪽수' : 200, '추천유무' : False})
books.append({'제목' : '플랫폼 비즈니스', '출판연도' : '2017', '출판사' : 'B', '쪽수' : 584, '추천유무' : True})
books.append({'제목' : '빅데이터 마케팅', '출판연도' : '2014', '출판사' : 'A', '쪽수' : 296, '추천유무' : True})
books.append({'제목' : '외식경영 전문가', '출판연도' : '2010', '출판사' : 'B', '쪽수' : 526, '추천유무' : False})
books.append({'제목' : '십억만 벌어보자', '출판연도' : '2013', '출판사' : 'A', '쪽수' : 248, '추천유무' : True})

# for book in books:
#     print(book)
# print("books[0].keys() = ", books[0].items())
# print("books[0] = ", books[0])
# print("books[0].values() = ", books[0].values())
# print("books[0].items = ", books[0].items())
#
# for key in books[0].keys():
#     print(key)
# for value in books[0].values():
#     print(value)
#
# for key, value in books[0].items():
#     print(key, "\t=\t\t", value)


many_page = list()

many_page2 = list()
recommends = list()
recommends2 = list()
all_pages = 0
pub_company = set()
pub_company2 = set()
pub_company_list = list()

for i in range(5):
    if books[i]['쪽수'] > 250:
        many_page.append(books[i]['제목'])

for book in books:
    if book['쪽수'] > 250:
        many_page2.append(books[i]['제목'])

for i in range(5):
    if(books[i]['추천유무']):
        recommends.append(books[i]['제목'])

for i in range(5):
    if books[i]['추천유무'] == True:
        recommends2.append(books[i]['제목'])

for i in range(5):
    all_pages = all_pages + books[i]['쪽수']

for book in books:
    pub_company_list.append(book['출판사'])
    pub_company.add(book['출판사'])
pub_company2 = set(pub_company_list)

print('1번답 = ', many_page)
print('1번답 = ', many_page2)
print('2번답 = ', recommends)
print('2번답 = ', recommends2)
print('3번답 = ', all_pages)
print('4번답 = ', pub_company)
