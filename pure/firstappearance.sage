def slope(x,y,i1,i2):
    return float(y[i2] - y[i1]) / float(x[i2] - x[i1])

def check(x,y,slope, i):
    for i2 in range(i3 + 1, len(x)):
        nextY = y[i] + (x[i2] - x[i]) * slope
        if y[i2] == nextY:
            print("(" + str(x[i2]) + ", " + str(y[i2]))

data = open("firstdenom")
x = []
y = []
line = data.readline()
count = 0
while(line != '' and count < 50):
    xy = line.split(' ')
    x.append(int(xy[0]))
    y.append(int(xy[1]))
    line=data.readline()
    count += 1

for i1 in range(0,count):
    for i2 in range(i1 + 1, count):
        for i3 in range(i2 + 1, count):
            s= slope(x,y,i1,i2)
            if (float(x[i3] - x[i2])*s + y[i2]) == y[i3]:
                print("(" + str(x[i1]) + ", " + str(y[i1]))
                print("(" + str(x[i2]) + ", " + str(y[i2]))
                print("(" + str(x[i3]) + ", " + str(y[i3]))
                check(x,y,s,i3)
                print("\n")
