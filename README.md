# Bank Tech Test

## How to use

#### 1. Open your terminal and clone the repository:
`git clone git@github.com:edthomas93/bank-tech-test.git`

#### 2. Install the gemfiles. The gems are rspec to see all passing tests, simplecov to see the test coverage and rubocop to see any formatting errors:
`bundle install`

#### 3. To see if the tests are passing and the coverage type from the folder 'bank_tech_test':
`rspec`

#### 4. To run the program start IRB:
`irb`

#### 5. Require file you wish to use:
`require './lib/account.rb'`

#### 6. Create an account:
`account = Account.new`

#### 7. Process several transactions
* You can credit the account a certain amount by inputting:
  `account.deposit(amount)`
* You can debit the account a certain amount by inputting:
  `account.withdraw(amount)`

#### 8. Print the statement to see your history and balance:
`account.print_statement`

#### 9. When finished, exit IRB:
`exit`

## Approach

As this is a tech test I was hoping to implement all philosophies that I have learnt at Maker's so far. This included creating user stories and then creating Test-Driven, readable, modularised, DRY code to satisfy these desired features.

####User stories:
```
As a customer,
To increase the balance in my account,
I want to be able to make deposits.
```
```
As a customer,
To access the money I have deposited,
I want to be able to make withdrawals.
```
```
As a customer,
To be able to monitor my spending,
I want to be able to view my bank statement.
```

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
