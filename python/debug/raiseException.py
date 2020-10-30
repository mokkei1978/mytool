def func1():
    func2()

def func2():
    raise Exception('Error at func1')

func1()
