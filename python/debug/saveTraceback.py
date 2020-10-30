import traceback

def func1():
    func2()

def func2():
    raise Exception('Error at func1')

try:
    func1()
except:
    err_file = open('error.txt','w')
    err_file.write(traceback.format_exc())
    err_file.close()
    print('Record traceback in error.txt.')
