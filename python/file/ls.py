"""あるディレクトリ内のファイルを示す"""

from pathlib import Path

p=Path("../f90")

for pfile in sorted(p.glob("**/*")):
    print(pfile)

print()
print("Python program:")
for pfile in p.glob("**/*.py"):
    print(pfile)
    print("  suffix :",pfile.suffix)
