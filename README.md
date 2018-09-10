# Bank Tech Test

## How to use

#### 1. Upon cloning this repository, open your terminal and run the following command to install the require gemfiles. The gems are rspec to see all passing tests, simplecov to see the test coverage and rubocop to see any formatting errors.
```
bundle install
```

#### 2. Run IRB from the main folder 'bank_tech_test'
```
irb
```

#### 3. Require file you wish to use
```
require './lib/statement.rb'
```

#### 4. Stop IRB return statements printing to avoid long statements
```
conf.return_format = ""
```

#### 4. Create an account and statement for the account
```
account = Account.new
statement = Statement.new(account)
```

#### 5. Process several transactions
* You can credit the account a certain amount by inputting:
  ```
  account.deposit(amount)
  ```
* You can debit the account a certain amount by inputting:
  ```
  account.withdraw(amount)
  ```

#### 6. Print the statement to see your history and balance
```
statement.print_statement
```

#### 7. To see the number of tests and test coverage
```
rspec
```

#### 8. When finished, exit IRB
```
exit
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