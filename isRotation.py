def isRotation(string1, string2):
  double = string1 + string1
  return bool(double.find(string2) != -1)

print("terwa is rotation of water? ")
print(isRotation("water", "terwa"))

print("terwas is rotation of water? ")
print(isRotation("water", "terwas"))
