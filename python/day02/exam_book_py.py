books = list()

books.append({'제목' : '파이썬 프로그램', '출판연도' : '2016', '출판사' : 'A', '쪽수' : 200, '추천유무' : False})
books.append({'제목' : '플랫폼 비즈니스', '출판연도' : '2017', '출판사' : 'B', '쪽수' : 584, '추천유무' : True})
books.append({'제목' : '빅데이터 마케팅', '출판연도' : '2014', '출판사' : 'A', '쪽수' : 296, '추천유무' : True})
books.append({'제목' : '외식경영 전문가', '출판연도' : '2010', '출판사' : 'B', '쪽수' : 526, '추천유무' : False})
books.append({'제목' : '십억만 벌어보자', '출판연도' : '2013', '출판사' : 'A', '쪽수' : 248, '추천유무' : True})

many_page = [book['제목'] for book in books if book['쪽수'] > 250]
recommends = [book['제목'] for book in books if book['추천유무']]
pub_companies = {book['출판사'] for book in books}
all_pages = sum([book['쪽수'] for book in books])

print(many_page)
print(recommends)
print(all_pages)
print(pub_companies)