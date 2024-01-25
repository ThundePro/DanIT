_firstNumber = int(input("Enter your first number: "))

_secondNumber = int(input("Enter second number: "))

_operations = input("Enter operation: ")

_result = None

if _operations == "+":
    _result = _firstNumber + _secondNumber
elif _operations == "-":
    _result = _firstNumber - _secondNumber
elif _operations == "*":
    _result = _firstNumber * _secondNumber
elif _operations == "/":
    _result = _firstNumber / _secondNumber

print(f"Result: {_firstNumber} {_operations} {_secondNumber} = {_result}")