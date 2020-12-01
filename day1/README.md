# Day 1 problem
Solution: Haskell

## Prerequisite
### Software requirements
- Haskell interpreter. E.g. by running command:  
  ```sudo apt-get install ghc cabal-install```
- (Optional: Unit test framework)
  ``cabal install HUnit````

### File requirements
Download your data as "day1RawDataDump.txt". It should look similar as example data in "day1ExampleData.txt".


## Running
### Option 1: Compile and run executable
```
ghc --make day1Solution
./day1Solution
```

### Option 2: Run interactively
```
ghci day1Solution
```

## Testing
### Run tests interactively
Running following commands will compile both the solution and test files and loads their modules for interactive shell. The test cases can be run from there.
```
ghci day1SolutionTest
runTestTT tests
```

Running test cases interactively allows e.g. following debugging commands:
- `:t something` checks the type of "something"
- `something` checks the value of "something"
