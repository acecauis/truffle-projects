// Creating Fibonacci Solidity contract
pragma solidity ^0.4.22;

// Recall that defining a 'contract' can be thought of as defining a
// 'class' as in Python
contract Fibonacci {


// 'uint[]' is defining an 'unsigned integer' array

// 'fibseries' is the name of 'uint[]' ('unsigned integer' array)
uint[] fibseries;

  // Defining a function called 'generateFib()' which takes a variable
  // 'n' -- where 'n' is of 'unsigned integer' datatype.

  // 'public' denotes this function to be 'public-facing' such that
  // the function 'generateFib()' may be viewed publically on the
  // Ethereum blockchain.

///////////////////////////////////////////////////////////////////////////

    // NOTE:  Because the variable declaration of the array of integers
    //        'fibseries' is defined **oustide** of any function,
    //        the 'fibseries' array will be **saved in storage** (instead)
    //        of memory), provoking a transaction to occur when the
    //        contract is run.


    // NOTE2: 'unint' and all other primitive types are value-type and not
    //        reference-type. So that means that the value of these
    //        variables are copied every time they are used.

    //        'structs' and 'arrays' are **reference types**, so you **can
    //        specify the 'storage' location** and when you do it it will
    //        **point to the reference object passed in the function**
    //        instead of having the **value in memory**


///////////////////////////////////////////////////////////////////////////
  // n = how many in the series to return
  function generateFib(uint n) public {

    // As per the definition of a fibonacci sequence described in the
    // README.md, we are setting the first two numbers to 1.

    // Using the 'push()' member function to set the first numbers in
    // the fibonacci sequence to 1.

    // From Solidity documentation (http://solidity.readthedocs.io/en/develop/types.html):

        // Dynamic storage arrays and 'bytes' (not 'string') have a member
        // function called 'push' that can be used to append an element
        // at the end of the array.

        // 'push' returns the new array length

    // set 1st and 2nd entries
    fibseries.push(1);
    fibseries.push(1);


    // Initializing a 'for' loop:
        // for each 'uint' ('unsigned integer') in the iteration that
        // is equal to 2...
        // for each iteration greater than 'n'...
        // for every iteration, add 1

    // generate subsequent entries
    for (uint i=2; i < n; i++) {
      // Using 'push' member function, append a new uint that is equal to
      // the sum of: the fibonacci series' index of the current iteration
      // minus 1, and the fibonacci series' index of the current
      // iteration minus 2
      fibseries.push(fibseries[i - 1] + fibseries[i - 2]);
    }

  }

}
