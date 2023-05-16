# 문제.
# 할인액(discount) 계산:
#     주문액이 10만원 이상이면 10% 할인
#     주문액이 5만원 이상 10만원 미만이면 5% 할인
#     주문액이 5만원 미만이면 할인 없음
def order(price, qt=100):               # 기본값 지정
    amount = price * qt
    if amount >= 100000:
        discount = amount * 0.1
    elif amount >= 50000:
        discount = amount * 0.05
    else:
        discount = amount
    result = amount - discount
    return amount, discount, result

price = int(input('가격: '))
qt = int(input('개수: '))
amount, discount, result = order(price, qt)
print(f'주문액: {amount}\n할인액: {discount}\n지불액: {result}')
