import folium

# zoom_start min과 max 함 찾아봐라
my_loc = folium.Map(location=[36.47960685470063, 127.13871970437835], zoom_start=18)


# 마커 찍고, 클릭하면 팝업창나옴, 그리고 위에 만든 지도에 추가
folium.Marker([36.47960685470063, 127.13871970437835], popup=folium.Popup('집', max_width=100)).add_to(my_loc)

my_loc.save('visual02.html')


# import folium
#
# my_loc = folium.Map(location=[36.47960685470063, 127.13871970437835],zoom_start=18)
# folium.Marker([36.47960685470063, 127.13871970437835],popup=folium.Popup('멀티캠퍼스 선릉',max_width=100)).add_to(my_loc)
#
# my_loc.save('visual02.html')