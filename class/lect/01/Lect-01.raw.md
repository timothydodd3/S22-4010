
m4_include(../../../setup.m4)

# Lecture 01 - Syllable and Intro

# S20-4010 and 5010 - Special Topics - BlockChain
# Block Chain Class 4010-5010, University of Wyoming, Spring 2020

## Class Overview
	1. What is Blockchain - what is Bitcoin / Ethereum / Other token systems
	2. The worlds worst, most expensive database
	3. What is the "hype" - what is real.
	4. Economics - Coin, ICO, Stocks, Bonds, Tokens, Utility Tokens, A Security
	5. Legal Ramifications.  ICOs 506(d), Subpart (s)
	6. Programming - 1/2 in go, 1/2 in Solidity (Etherem) and Web front end (JavaScript/HTML/CSS).
	7. Some Homework
	8. Write a Paper - How will blockchain effect the economy.
	9. 2 tests (Midterm and Final)
	10. Why Go
	11. Proof of work
	12. Proof of stake
	13. Enough Go to make it through this class (and be able to convincingly tell an employer that you have programmed in Go)
	14. Why Ethereum? Solidity?
	15. dApp - what is that?  What is web3?
	16. A detailed understanding of the security model behind Blockchain
	17. Some advanced stuff on security - distributed computation and public/private keys, distributed key generation.
	18. What is a "tangle"
	19. Why is blockchain so slow?
	20. How to explain "blockchain" to people - the 30 second elevator pitch.
	21. History - of accounting

## De-Hype Blockchain

1/2 of the world has made cryptocurrency illegal.  Almost 1/2 the world has governments implementing  "national" crypto 
currency systems for the national currency.



## git is the primary location for the class files.

### Mac

Start on a Mac with installing "brew", then "git".

Homebrew: [https://brew.sh/](https://brew.sh/)

Then Git with:

```
brew install git
```

Then at the command line on a Mac or Linux:

```
mkdir -p go/src/github.com/Univ-Wyo-Education
cd go/src/github.com/Univ-Wyo-Education
git clone  https://github.com/Univ-Wyo-Education/S20-4010.git
```

then when I have updated stuff in git you can do

```
git pull
```

### Windows


On a Windows system, install [https://git-scm.com/download/win](https://git-scm.com/download/win), then bring up a bash shell
and:

```
mkdir go
mkdir go/src
mkdir go/src/github.com
mkdir go/src/github.com/Univ-Wyo-Education
cd go/src/github.com/Univ-Wyo-Education
git clone  https://github.com/Univ-Wyo-Education/S20-4010.git
```

then when I have updated stuff in git you can do

```
git pull
```

### Linux

See: [https://gist.github.com/derhuerst/1b15ff4652a867391f03#file-mac-md](https://gist.github.com/derhuerst/1b15ff4652a867391f03#file-mac-md)
If you are using other than Debian/Ubuntu for Linux see me and we will work 1-on-1 to get you setup and going.


# Layout

Lectures can be found in `./class/lect/`.  

Assignments can be found in `./homework`.


