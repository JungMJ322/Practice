import folium
import json

# 1. starbucks01.json 파일을 읽어 오자
with open('./starbucks01.json', 'r', encoding='utf-8') as f:
    starbucks = json.load(f)

# print(starbucks)



# 2. 지도 만들자
my_loc = folium.Map(location=[36.47960685470063, 127.13871970437835], zoom_start=15)


# 3. starbucks01.json 파일을 읽어드린 내용(1에서 실행한 결과)을 가지고
# 반복해서 starbucks 매장의 marker를 만들어 지도에 추가하자
for starbuck in starbucks['store_list']:
    folium.Marker([starbuck['lat'], starbuck['lot']], popup=folium.Popup(starbuck['s_name'], max_width=100)).add_to(my_loc)


# 4. 지도 저장하자
my_loc.save('visual03.html')