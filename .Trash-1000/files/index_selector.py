# x is the total count,y is the current count
def test(x,y):
    if(x<2):
        return
    list=[0 for i in range(3*x)]
    curIndex=0
    for i in range(len(list)):
        
        if(curIndex==1):
            curIndex=2
        if(i%3==1):
            list[i]=1
        elif(i%3==2):
            list[i]=curIndex
            curIndex+=1
        else:
            list[i]=curIndex
    
    return list[y%len(list)-1]
            
        

# if __name__ == '__main__':
#    test(4,19)
