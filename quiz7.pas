import random

class QA:
  def __init__(self, question, correctAnswer, otherAnswers):
    self.question = question
    self.corrAnsw = correctAnswer
    self.otherAnsw = otherAnswers

qaList = [QA("What's Dream Theater's guitar player name?", "John Petrucci", ["Adrian Smith", "Kirk Hammett"]),
QA("What's Iron Maiden's singer name?", "Bruce Dickinson", ["James Labrie", "Ray Alder", "Tenacious D"]),
QA("Who wrote the lyrics of Iron Maiden song Phantom of the Opera?", "Steve Harris", ["Adrian Smith", "Bruce Dickinson", "Paul Di'anno"]),
QA("Who wrote the lyrics of Dream Theater song Space-Dye Vest?", "Kevin Moore", ["John Petrucci", "Mike Portnoy"]),
QA("Who wrote the lyrics of Dream Theater song Pull me under", "Kevin Moore", ["Mike Portnoy", "John Petrucci", "James Labrie", "John Myung"])]

corrCount = 0
random.shuffle(qaList)
for qaItem in qaList:
  print(qaItem.question)
  print("Possible answers are:")
  possible = qaItem.otherAnsw + [qaItem.corrAnsw] # square brackets turn correct answer into list for concatenating with other list
  random.shuffle(possible)
  count = 0 # list indexes start at 0 in python
  while count < len(possible):
    print(str(count+1) + ": " + possible[count])
    count += 1
  print("Please enter the number of your answer:")
  userAnsw = input()
  while not userAnsw.isdigit():
    print("That was not a number. Please enter the number of your answer:")
    userAnsw = input()
  userAnsw = int(userAnsw)
  while not (userAnsw > 0 and userAnsw <= len(possible)):
    print("That number doesn't correspond to any answer. Please enter the number of your answer:")
    userAnsw = input()
  if possible[userAnsw-1] == qaItem.corrAnsw:
    print("Your answer was correct.")
    corrCount += 1
  else:
    print("Your answer was wrong.")
    print("Correct answer was: " + qaItem.corrAnsw)
  print("")

print("You answered " + str(corrCount) + " of " + str(len(qaList)) + " questions correctly.")
