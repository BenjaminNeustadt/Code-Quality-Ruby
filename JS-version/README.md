# Bank tech test

Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time.  This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or Node.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```



Planning:
* Will start off the TDD by implementing everything inside one class, and then extracting everything to have a separation of concerns
* I would first like to write a test to check that the format returned is correct when we return 
* Will use: 

- 1 class bankBook()
  - has a constructor
  - has 3 methods:
    - credit/add
    - debit/subtract
    - print (which is a getter)
      - print returns the history of transactions on that account
        - the transactions therefore need to be stored in the constructor:

          - Each method will store values inside a hash:
          
            EG: debit(400) will return: {
              date: DateNow(), 
              credit: undefined, 
              debit: 400, 
              balance: this.currentBalance - debit
              })

          - if the debit method is called with an argument, that argument (a number) is added with a date, and the new balance to a constructor : this.debit
          - if the credit method is called with an argument, that argument is added with a date, and the new balance to a constructor: this.credit

          - The constructors are initially empty arrays, the hashes are pushed to the arrays

          - We will need to check if the input is actually a number, this can be an edge case for later
          
- output should appear with most recent transactions first, and oldest last (this means that reverse should not be necessary)

- WILL FOCUS ON FORMATTING AFTERWARDS!


## IMPLENTATION:

INPUT                       OUTPUT
debit(400)                  date: [...], credit: undefined, debit: 400, balance: 400




## RESOURCES

* ways to format: 

https://stackoverflow.com/questions/8842546/best-way-to-pretty-print-a-hash

https://github.com/awesome-print/awesome_print

IN