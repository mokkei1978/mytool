#!/usr/bin/env python 
#vim:fileencoding=utf8  
import ctypes

addmodule = ctypes.CDLL("./add.so")

# 引数の型を指定する。今回はintのポインタ型
# Fortranのサブルーチン名"add"にアンスコ"_"をつける(gccでは)
addmodule.add_.argtypes = [ ctypes.POINTER(ctypes.c_int64),ctypes.POINTER(ctypes.c_int64)]
      
# 戻り値の型を指定する。Fortranのサブルーチンはvoidしか返せない
addmodule.add_.restype = c_void_p  

# 呼び出しに使う引数はctypesの型でラップする
a,b = 10,8 
a = c_int64(a)
b = c_int64(b)
 
# byrefでポインタにして渡す         
addmodule.add_(byref(a),byref(b)) 
print(b.value) # 18
