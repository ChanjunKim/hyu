from selenium import webdriver
from bs4 import BeautifulSoup as bs
import pandas as pd
import time
import random

# chromedriver는 다운로드 후 경로 지정을 해줘야 한다. (현재는 같은 폴더 )
driver = webdriver.Chrome('C:/Users/user/Desktop/Python/chromedriver/chromedriver')
driver.implicitly_wait(3)

# 네이버 메인에 최초 한 번 접근 후에 로그인 페이지로 접속하는 방법이다.
driver.get("http://www.naver.com/")
time.sleep(random.randrange(2,5))
driver.find_element_by_css_selector('#account > div > a > i').click() # 로그인 페이지 접속
time.sleep(random.randrange(3,6))
# 아이디와 비밀번호도 키보드가 입력한 것처럼 하나하나씩 입력한다.

# 내 아이디랑 비밀번호를 '' 안에 적습니다.
for id in '---':
    time.sleep(0.02)
    driver.find_element_by_name('id').send_keys(id)
time.sleep(random.randrange(1, 3))
for pw in '---':
    time.sleep(0.02)
    driver.find_element_by_name('pw').send_keys(pw)
time.sleep(random.randrange(1, 3))

# 바로 클릭하면 메크로인걸 들키기 때문에 콘솔창에 go 를 입력해서 그 다음 작업을 실행하도록
log_flag = input("gogo : ")
if log_flag == 'go':
    driver.find_element_by_css_selector('#frmNIDLogin > fieldset > input').click()

# 첫번째 url은 합격자소서 메인, 두번째는 합격자소서 1page 이므로 페이지를 넘기기 위해서는 젤 뒤에 페이지를 증가시켜가면서 검사
# https://cafe.naver.com/ArticleList.nhn?search.clubid=16996348&search.menuid=654&search.boardtype=L
# https://cafe.naver.com/ArticleList.nhn?search.clubid=16996348&search.menuid=654&search.boardtype=L&search.questionTab=A&search.totalCount=151&search.page=1

# page 끝에 숫자를 비워놓고 for 문으로 하나하나씩 검사
page_url = "https://cafe.naver.com/ArticleList.nhn?search.clubid=16996348&search.menuid=654&search.boardtype=L&search.questionTab=A&search.totalCount=151&search.page="
res_list = []
for i in range(123, 324):
    time.sleep(random.randrange(2, 3))
    driver.get(page_url + str(i+1))
    # iframe으로 프레임 전환
    driver.switch_to.frame('cafe_main')

    # href 속성을 찾아 url을 리스트로 저장한다.
    article_list = driver.find_elements_by_css_selector('span.aaa > a.m-tcol-c')
    article_urls = [i.get_attribute('href') for i in article_list]
    print(article_urls)

    # Beautifulsoup 활용
    for article in article_urls:
        time.sleep(random.randrange(5, 9))
        driver.get(article)
        # article도 switch_to_frame이 필수
        driver.switch_to.frame('cafe_main')
        soup = bs(driver.page_source, 'html.parser')

        # 한번씩 지정 태그에 없는 것이 있어서.. try except 로 없으면 자동으로 넘어가게
        try :
            content = soup.select('div.NHN_Writeform_Main')[0].get_text()
            # content = soup.select('div.inbox')[0].get_text()
        except:
            continue

        print(content)
        res_list.append(content)
        # time.sleep 작업도 필요하다.
        time.sleep(random.randrange(5, 9))

# 결과 데이터프레임화
cafe_df = pd.DataFrame(res_list)

# csv파일로 추출
cafe_df.to_csv('cafe_crawling123.csv', index=False)
