# Bank tech test

As part of week 10 of Makers Bootcamp we underwent a code quality formation. This is the result of coach feedback. The tasks given were technical tests where we could demonstrate our understanding of test driven development, and the principles of clean code - specifically the single responsibility principle.

**Test instructions are <a href="#instructions">here</a>**
You can see a JavaScript solution to this test [here](https://github.com/BenjaminNeustadt/Code-Quality-JS)

---
# Usage

### Installation

1. Git clone this repo
2. Install the gems with: `bundle install`
3. Run the tests with: `rspec -fd` (the flag details the available tests and their outcome)

### Program usage

1. To use run: `irb -r './lib/transaction.rb` (this loads the necessary file to the REPL) 
2. Run: `transaction = Transaction.new` to generate new instance of the necessary class.
3. Run: `transaction.deposit([amount])` to deposit money
4. Run: `transaction.withdraw([amount])` to withdraw money
5. Run: `puts transaction.to_s` or `print transaction.to_s` to print a statement (`puts` or `print` will format it to the requirements of the instructions)
6. You can see a demo of this  <a href="#demo">here</a>

---

# Approach

The user only needs to interact with one class, the methods are distributed in a balanced way between two classes.
The exercise was test driven, meaning I was able to approach the task on a granular level. I started by implementing a Transaction class, and decided that I wouldn't need more than two classes to respect the single responsibility principle, and ensure there wasn't too much going on in one place.

I chose to focus on the formatting after the logic functionality had been written. This is where I created a Report class. 

Once the program was written I decided that it would be more convenient for a user to interact with one class. I therefore created private constants within the Transaction class in order to be able to ineherently call the functionality of the Report class from within Transaction. This means that we can access all methods of Report from within Transaction.

I used attribute readers and writers to distribute access rights accordingly, as well as sanitize the code aesthetically and improve readability.

---

# Demo

### Program Use

<a name="demo"></a>

<p align="demo">
   <img src="/documents/bank_tech_test.gif">
</p>

### Tests

<p align="test">
   <img src="/documents/bank_tech_test_test.gif">
</p>

---

<a name="instructions"></a>
:information_source: **Below are the original instructions from Makers**

[Original Assignment](https://github.com/makersacademy/course/blob/main/individual_challenges/bank_tech_test.md)
[Assignment Criteria](https://github.com/makersacademy/course/tree/main/individual_challenges)


Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time.
This practice session is about producing the best code you can when there is a minimal time pressure.
You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or Node.
  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given**   a client makes a deposit of 1000 on 10-01-2023
  **And**   a deposit of 2000 on 13-01-2023
  **And**   a withdrawal of 500 on 14-01-2023
  **When**  she prints her bank statement
  **Then**  she would see:

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

### Questions to consider beyond exercise

Wording of the methods is important because we can debit a negative
amount, we cannot deposit a negative amount
