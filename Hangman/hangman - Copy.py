import json
import math
import random

def load_words():
    with open('words_alpha.txt') as word_file:
        valid_words = set(word_file.read().split())

    return valid_words

def get_word():
    english_words = load_words()
    # demo print
    word = ''
    wcount=0
    wordnum = random.randint(0,370104)
    for i in english_words:
        wcount+=1
        
        if(wcount==wordnum):
            word = i
    #print("fate" in english_words)
    return word

def TGuess(guess,word,cur):
    pos = []
    temp =''
    let = False
    left = word.__len__()
    count=0
    for i in word:
        if guess==i:
            pos.append(i)
    for i in cur:
        if i != "_":
            pos.append(i)
    if(word.find(guess)==-1):
        print("Incorrect guess \n ")
        return cur
    else:
        print(pos)
        for i in word:
            for p in pos:
                if p==i:
                    temp +=p
                    let = True
                    break
            if(let == False):
                temp+="_" 
            let = False
            count+=1
        for i in temp:
            if i !="_":
                left -=1
        if left == 0:
            print(temp)
            return True
        else:
            return temp

def stickman(lives):
    match (lives):
        case 5:
            print("\t   0 \t \n \t  /|\\ \t \n \t  /\\ \t ")
        case 4:
            print("\t   0 \t \n \t  /|\\ \t \n \t  /")
        case 3:
            print("\t   0 \t \n \t  /|\\ \t \n  ")
        case 2:
            print("\t   0 \t \n \t  /| \t ")
        case 1:
            print("\t   0 \t \n \t   |")


if __name__ == '__main__':
    lives = 5
    word = get_word()
    guess = ''
    dis = ''
    temp = ''
    
    for i in word:
        dis +='_'
    while(lives !=0):
        if dis == True:
                print("Congratulations, you have won the game")
                exit()
        print(dis+ '\t'+ 'Lives: ' + str(lives))
        print("type a letter to reveal it")
        guess = input()
        if(guess=="exit"):
            break
        #print(guess.__len__())
        if(guess.__len__()==1):
            temp = dis
            dis = TGuess(guess,word,dis)
            if temp == dis:
                lives-=1
            #print(dis)
        else:
            print("pick only a single letter")
        stickman(lives=lives)
    print("You have lost, you loser \n The word was "+ word)
    print("\t  0 \t")