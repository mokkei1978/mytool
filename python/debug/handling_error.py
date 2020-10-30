def draw_square(pattern,width,height):
    if len(pattern) != 1:
        raise Exception('Pattern must be single character')



pattern='lt'
w=2
h=3
try:
    draw_square(pattern,w,h)
except Exception as err:
    print('ERROR: '+str(err))
