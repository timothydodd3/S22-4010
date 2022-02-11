
<style>
.pagebreak { page-break-before: always; }
.half { height: 200px; }
</style>
<style>
.pagebreak { page-break-before: always; }
.half { height: 200px; }
.markdown-body {
	font-size: 12px;
}
.markdown-body td {
	font-size: 12px;
}
</style>





# Lecture 11 - Elliptic Curve

## Feb 11 2022

Every transaction has to be digitally signed to verify that the author
of the transaction (the spender) is valid.   Both Bitcoin and Ethereum
use EC cryptography to do this.  Specifically the ECDSA or Elliptic Curve
Digital Signature Algorithm to do this.

Let's take a look at how EC works.  This is not a how-to-implement EC,
this is, "lets understand EC enough that we can effectively use EC" approach.

Let a = -3 and b = 5 with:

<center><img src="formula1.png"></center>

We get a graph that looks like

<center><img src="p1.png"></center>

Note: it is not a function.   

Also there are good and bad elliptic curves for this so picking a good one
is required.  

Also this process will require prior agreement between the parties on what
curve is to be used.  So we have a bunch of standardized curves like
Curve25519 and P-256 etc.

For our example we have a tiny curve with small values - the real values
are `2**256` in size.

We can define addition on this curve with points A and B as, find A, find B,
draw a line between them - switch sides and this is `A + B`.

<center><img src="p2.png"></center>

It is important to node that we do not have any definition of subtraction.
This will be our "trapdoor" later in our encryption process.  All of our
operations are uni-directional.

Given that we have addition we can define multiplication as using repeated
addition.  We will get a more efficient multiplication later.   Since
subtraction is not defined, there is no division.

Let's add a new value, 'C'.

<center><img src="p3.png"></center>


