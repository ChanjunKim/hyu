import turtle as t
import math

t.color('blue')
distance1 = 100
distance2 = math.sqrt(distance1**2 + distance1**2)
distance3 = math.sqrt((distance1/2)**2 + (distance1/2)**2)

for i in range(2, 6):
    t.setheading(i*90)
    t.forward(distance1)

for i in range(1, 4, 2):
    t.setheading(90+(45*i))
    t.forward(distance3)

t.setheading(270+45)
t.forward(distance2)
t.setheading(90)
t.forward(distance1)
t.setheading(180+45)
t.forward(distance2)

t.done()