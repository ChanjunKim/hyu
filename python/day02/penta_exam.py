import turtle as t

color = ['red', 'green', 'blue', 'yellow', 'purple', 'cyan', 'magenta', 'violet']
ang = 45
end_num = 50
distance = 1

x = 0
for i in range(end_num):
    t.color(color[x])
    t.pensize(i*0.3)
    t.setheading(ang*i)
    t.forward(distance)
    distance = distance + 3
    x = x+1
    if(x > 7):
        x = 0

t.done()