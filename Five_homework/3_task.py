_filePath = 'count.txt'
_numbers = None
try:
    with open(_filePath, 'r') as file:
        _content = file.read()

        _numbers = [float(_number) for _number in _content.split()]
except FileNotFoundError:
    print(f"File {_filePath} not found")

_largestNumber = _numbers[0]
for _num in _numbers:
    if _num > _largestNumber:
        _largestNumber = _num

print(f"The largest number is {int(_largestNumber)}")