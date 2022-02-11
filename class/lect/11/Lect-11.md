
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

We can define addition on this curve with points `A` and `B` as, find `A`, find `B`,
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

All of this is good until we find that `A == B`, or we are adding a point
to itself.   Let's call this point P where we are adding `P + P`.
We can't draw a line from `P` to `P`, so what we need is the tangent 
line to the point `P`.

Our original formula is, `y**2 = x**3 -3x + 5`, so let's take the derivative
as that gives us the tangent to a curve.   We have to take the derivative on
both sides, then combine because this is not a function.

So... that gives us `dx/dy y**2 = 2y` and `dy/dx x**3 -3x + 5 = 3x**2 - 3`.
Now we combine to get a function:  `( 3x**2 - 3 ) / 2y` and we can calculate
the slope of our tangent line!

So `P + P == 2P` looks like:

<center><img src="p4.png"></center>

It turns out that we will want `2P + P == 3P` a little later so this 
works out as just doing the `P + P = 2P` above, then doing a `2P + P`
add operation.   

The results look like:

<center><img src="p5.png"></center>

So we can multiply `N` times `P` to get `NP`.

This looks like...

<center><img src="p6.png"></center>

After doing this is there any way to determine `P` from `NP`.
Remember that subtraction and division are not defined.  So with
large values of `P` and `N` we have a one way function.

`NP` is our public key - the one we share with the world.
`N` is our private key.  Think non-private = `NP` and 
private = `N` for Never-Loose-This, but if we have more than one party we will
make `N` be `M` for the 2nd party. (That makes `M` more-never-loose-this).


## Faster Multiplication.

If we had to do repeated addition to get multiplication this would be
**really** slow!   But there is a process.  First you need to remember that
we store numbers in binary.  Also we have to have some algebra applied.
We need `A + ( B + C ) == ( A + B ) + C`.   The proof of this is really
complex.   If you want to read about its See [Elliptic Curves Group Law](EllipticCurvesGroupLaw.pdf)
in this lecturer's notes.

By knowing this we can determine that `P + 3P == 2P + 2P == 4P`.

So a binary number, let's say `227P` is really:

<center><img src="227p.png"></center>

And that is an representation of a sum that looks like:

<center><img src="sum1.png"></center>

With the exponents converted:

<center><img src="sum2.png"></center>

So we can just double and add:

1. Add P and double P
2. Add 2P and double 2P
3. Double 4P
4. Double 8P
5. Double 16P
6. Add 32P and double 32P
7. Add 64P and double 64P
8. Add 128P and double 128P

This makes our `P + P` derivation above really important because we are doubling and adding
all the time.

In 8 steps we have multiplied by 227.    This gives us an `O(log n)` way to multiply and with
a real size of `2**256` for our space we know that we can multiply any number in 256 steps.



## Key Exchange.

Lot's of times we want 2 parties to be able to exchange keys without every transmitting the
keys to each other.    The keys are values that we can then use in a symmetric encryption 
system, like Aes256.   Aes256 takes a 32 byte key, so a `2**256` key is just perfect - it is
32 bytes!

To setup our communication we do this key-exchange, then each side has the key (without ever
transmitting it) and then they each use Aes256 to encrypt data.  This leaves out a bunch
of details that are important but is the underlying system with TLS 1.3 that supports `https:`
in our browsers.

This process is called Elliptic Curve Diffie-Hellman.

Let's start with `4 * 3 = 12` and `3 * 4 = 12`.  This relies on our group law.

<center><img src="4x3.png"></center>

Is the same as:

<center><img src="3x4.png"></center>

Both parties, `A` for Alice and `B` for Bob agree before hand on what the starting point `P` is 
and what curve they are working on.    So they can share public keys, `MP` and `NP`.   Now each
of them will compute:

`N * MP`:

<center><img src="NxMP.png"></center>

And `M * NP`:

<center><img src="MxNP.png"></center>

Each of these values generates the same result, `N * MP == M * NP`.   The resulting value is
secret because Bob keeps `N` a secret and Alice keeps `M` a secret.  So without sending values
they can each derive a key.







