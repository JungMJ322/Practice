from xml.etree import ElementTree
import requests
import re                           # 얘가 뭘까 정규식인데 함 찾아봐라

service_key='VXBYQ69L5Fwe5N6ROU%2BQDFRw2QT7VAQq2iW9WUSFjTxT5tCatN27CjwGwFKDLtqMhSaBV2BfjIAhytbw2lcWmg%3D%3D'
url = f'http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?ServiceKey={service_key}'
# print(url)

resp = requests.get(url)
# print(resp.text)

# xml parsing
tree = ElementTree.fromstring(resp.text)
print(tree)

for item in tree[1][0]:
    # print(item.find('gubun').text)
    if item.find('gubun').text == '합계':
        stdDay = re.sub(r'(\D)+', '', item.find('stdDay').text)
        # print(stdDay)
        stdDay = stdDay[2:4] + '/' + stdDay[4:6] + '/' + stdDay[6:8]
        # print(stdDay)
        incDec = item.find('incDec').text
        localOccCnt = item.find('localOccCnt').text
        overFlowCnt = item.find('overFlowCnt').text
        print(f'[{stdDay}]\n일일합계: {incDec}\n국내발생: {localOccCnt}\n해외발생: {overFlowCnt}')


