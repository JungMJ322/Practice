# 2. 영단어 등록/검색
eng_dict = {'quit': 'quit'}
while True:
    word = input('영어 단어 등록(종료는 quit) : ')
    if word == 'quit':
        break
    elif word not in eng_dict:
        word_value = input(word + '의 뜻 입력(종료는 quit) : ')
        eng_dict[word] = word_value
    else:
        print(word + '는 이미 등록된 단어 입니다.')
    print()
print(eng_dict)

while True:
    word = input('검색할 단어 입력(종료는 quit) : ')
    if word == 'quit':
        break
    elif word in eng_dict:
        print('{}의 뜻은 {}입니다(종료는 quit)'.format(word, eng_dict[word]))
    else:
        print(word + '는 사전에 없는 단어 입니다.')

print('종료합니다.')
