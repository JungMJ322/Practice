from django.shortcuts import render
from django.http import JsonResponse
from . import starbucks02

def index(request):
    return render(request, 'index.html')

def starbucks(request):
    total_stores_list = []
    for SiDo in starbucks02.getSiDo().keys():
        if SiDo == '17':
            result = starbucks02.getStore(sido_code='17')
            total_stores_list.extend(result)
        else:
            for GuGun in starbucks02.getGuGun(SiDo).keys():
                result = starbucks02.getStore(gugun_code=GuGun)
                total_stores_list.extend(result)
                print(1)

    print(len(total_stores_list))

    result_dict = dict()
    result_dict['list'] = total_stores_list

    return JsonResponse(result_dict)
