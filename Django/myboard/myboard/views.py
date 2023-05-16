from django.shortcuts import render, redirect
from .models import MyBoard, MyMember
from django.utils import timezone
from django.core.paginator import Paginator
from django.contrib.auth.hashers import make_password, check_password


def index(request):
    myboard = MyBoard.objects.all().order_by('-id')
    paginator = Paginator(myboard, 5)               # 페이지당 db row 개수
    page_num = request.GET.get('page', '1')         # 현재 페이지/ 없으면 1로
    
    # 페이지에 맞는 모델 가져오기
    page_obj = paginator.get_page(page_num)
    
    # 관련 메서드    하나하나 뭐하는지  찾아보기
    print(type(page_obj))                       # page 객체
    print(page_obj.count)                       # 모든 페이지의 객체 수
    print(page_obj.paginator.num_pages)         # 총 페이지 수
    print(page_obj.paginator.page_range)        # 페이지 번호 1부터 끝번호 까지 list 생성
    print(page_obj.has_next())                  # 다음 페이지가 있으면 True 반환
    print(page_obj.has_previous())              # 이전 페이지가 있으면 True 반환
    try:
        print(page_obj.next_page_number())      # 다음 페이지 숫자 반환
        print(page_obj.previous_page_number())  # 이전 페이지 숫자 반환
    except:
        pass
    print(page_obj.start_index())               # 각 page의 첫 번째 total_index를 반환
    print(page_obj.end_index())                 # 각 page의 마지막 번째 total_index를 반환

    return render(request, 'index.html', {'list': page_obj})

def insert_form(request):
    return render(request, 'insert.html')

def insert_res(request):
    myname = request.POST['myname']
    mytitle = request.POST['mytitle']
    mycontent = request.POST['mycontent']

    resulte = MyBoard.objects.create(myname=myname, mytitle=mytitle, mycontent=mycontent, mydate=timezone.now())

    if resulte:
        return redirect('index')
    else:
        return redirect('insertform')

def detail(request, id):
    return render(request, 'detail.html', {'dto': MyBoard.objects.get(id=id)})

def update_form(request, id):
    return render(request, 'update.html', {'dto': MyBoard.objects.get(id=id)})

def update_res(request):
    id = request.POST['id']
    mytitle = request.POST['mytitle']
    mycontent = request.POST['mycontent']

    myboard = MyBoard.objects.filter(id=id)
    resulte_title = myboard.update(mytitle=mytitle)
    resulte_content = myboard.update(mycontent=mycontent)

    if resulte_title + resulte_content == 2:
        return redirect('/detail/' + id)
    else:
        return redirect('/updateform/' + id)

def delete(request, id):
    result_delete = MyBoard.objects.filter(id=id).delete()

    if result_delete[0]:
        return redirect('index')
    else:
        return redirect('/detail/' + id)

def register(request):
    # get 방식으로 register를 요청하면 html(template)를 응답
    if request.method == "GET":
        return render(request, 'register.html')
    # post 방식으로 register를 요청하면 db에 data 저장
    elif request.method == "POST":
        myname = request.POST['myname']
        mypassword = request.POST['mypassword']
        myemail = request.POST['myemail']

        mymember = MyMember(myname=myname, mypassword=make_password(mypassword), myemail=myemail)
        mymember.save()
        
        return redirect('/')

    return redirect('/')

def login(request):
    if request.method == "GET":
        return render(request, 'login.html')
    else:
        myname = request.POST['myname']
        mypassword = request.POST['mypassword']

        mymember = MyMember.objects.get(myname=myname)

        if check_password(mypassword, mymember.mypassword):
            # 서버 session에 myname값을 넣어 놓는다
            request.session['myname'] = mymember.myname
            return redirect('/')
        else:
            return redirect('/login')

def logout(request):
    # login할 때 session에 넣어놓은 'myname'의 값을 삭제
    del request.session['myname']
    return redirect('/')