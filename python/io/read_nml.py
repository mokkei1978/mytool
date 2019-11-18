"""表ファイルを読む"""

with open('NAMELIST.JPN01.MONITOR','r') as f:
    line = f.readline()
    while line:
        if line[0] == '&':
            has_horz_range = False
        if 'horz_range' in line:
            has_horz_range = True
        if line[0] == '/':
            if not has_horz_range:
                print('  horz_range%ifirst             = 333,')
                print('  horz_range%ilast              = 861,')
                print('  horz_range%jfirst             = 703,')
                print('  horz_range%jlast              = 1403,')
        print(line,end="")
        line = f.readline()
