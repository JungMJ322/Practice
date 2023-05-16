import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import json
from matplotlib import font_manager, rc



def seoulDeath():
    data = pd.read_csv('./도로교통공단_어린이 사망교통사고 정보_20191231.csv', encoding="cp949")
    df = pd.DataFrame(data)

    df1 = df[['발생년', '사망자수', '발생지시도', '발생지시군구', '피해자_당사자종별']]
    df2 = df1.loc[df['피해자_당사자종별'] == '보행자']
    df3 = df2.loc[df['발생지시도'] == '서울']

    guname = ['은평구', '서대문구', '마포구', '동대문구', '성동구', '중랑구', '광진구', '강북구', '도봉구', '양천구', '구로구', '영등포구', '금천구', '동작구', '관악구', '강남구', '송파구']
    years = ['2015', '2016', '2017', '2018', '2019']


    seoulDict = dict()
    slDict = dict()


    # 해당하는 구 가져와 반복
    for gu in guname:
        df_gu = df3.set_index(['발생년'])
        yearDict = dict()

        # 연월일 자료 -> 연도 자료
        for year in years:
            df_gu_year = df_gu.loc[df['발생년'] == year]
            # print(df_gu_year['사망자수'])
            sum_person = 0
            # 사망자 수 더하기
            for _ in range(len(guname)):
                sum_person += int(df_gu_year['사망자수'].sum())
            print(sum_person)
            yearDict[year] = sum_person

        slDict[gu] = yearDict

    seoulDict['서울'] = slDict

    return seoulDict


print(seoulDeath())
