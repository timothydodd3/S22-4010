m4_include(../../../setup.m4)


m4_comment([[[

   February 2022      
Su Mo Tu We Th Fr Sa  
       1  2  3  4  5  
 6  7  8  9 10 11 12  
               ^--------------------
13 14 15 16 17 18 19  
20 21 22 23 24 25 26  
27 28                 
                      
]]])

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



	

