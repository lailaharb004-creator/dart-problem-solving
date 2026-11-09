# Level 1 --- Basic Logic & Conditions

**Difficulty:** Beginner\
**Language:** Dart

This practice set contains 15 programming exercises. For each exercise,
identify the inputs, determine the expected output, write the logic in
plain English, and then implement your solution in Dart.

------------------------------------------------------------------------

## 1. Age Checker

**Problem:**

Write a Dart program that asks the user to enter their age. The program
should determine the user's age category based on the following rules:

-   If the age is less than 0, display `Invalid Age`.
-   If the age is between 0 and 12, display `Child`.
-   If the age is between 13 and 17, display `Teenager`.
-   If the age is 18 or above, display `Adult`.

Make sure to handle invalid input, such as empty input or non-numeric
values.

**Example:**

``` text
Input: 16
Output: Teenager
```

## 2. Even or Odd

**Problem:**

Write a Dart program that asks the user to enter an integer. Determine
whether the number is even or odd.

Display `Even` if the number is divisible by 2, otherwise display `Odd`.

**Examples:**

``` text
Input: 7
Output: Odd

Input: 12
Output: Even
```

## 3. Positive, Negative, or Zero

**Problem:**

Write a Dart program that asks the user to enter a number. Determine
whether the number is positive, negative, or zero.

Display one of the following messages:

-   `Positive` if the number is greater than zero.
-   `Negative` if the number is less than zero.
-   `Zero` if the number equals zero.

**Example:**

``` text
Input: -5
Output: Negative
```

## 4. Grade Calculator

**Problem:**

Write a Dart program that asks the user to enter a student's grade (from
0 to 100).

Determine the student's letter grade using the following grading scale:

  Score     Grade
  --------- -------
  90--100   A
  80--89    B
  70--79    C
  60--69    D
  0--59     F

If the entered grade is less than 0 or greater than 100, display
`Invalid Grade`.

**Example:**

``` text
Input: 85
Output: B
```

## 5. Largest Number

**Problem:**

Write a Dart program that asks the user to enter three numbers.

Compare the three numbers and determine which one is the largest.

Display the largest number.

If two or more numbers have the same maximum value, the program should
still display that maximum value correctly.

**Example:**

``` text
Input:
10
25
15

Output: 25
```

## 6. Leap Year Checker

**Problem:**

Write a Dart program that asks the user to enter a year.

Determine whether the year is a leap year or not.

A year is a leap year if:

-   It is divisible by 400, OR
-   It is divisible by 4 but NOT divisible by 100.

Otherwise, it is not a leap year.

Display `Leap Year` or `Not a Leap Year`.

**Examples:**

``` text
Input: 2024
Output: Leap Year

Input: 1900
Output: Not a Leap Year
```

## 7. Vowel Checker

**Problem:**

Write a Dart program that asks the user to enter a single character.

Determine whether the character is a vowel or a consonant.

The vowels are: `a, e, i, o, u`.

The program should be case-insensitive, meaning that uppercase and
lowercase letters should both be accepted.

If the input contains more than one character or is not an English
letter, display `Invalid Input`.

**Examples:**

``` text
Input: A
Output: Vowel

Input: b
Output: Consonant
```

## 8. Password Checker

**Problem:**

Write a Dart program that asks the user to enter a password.

Check whether the password meets the following requirements:

-   At least 8 characters long.
-   Contains at least one uppercase letter.
-   Contains at least one lowercase letter.
-   Contains at least one digit.

If all requirements are satisfied, display `Strong Password`.

Otherwise, display `Weak Password`.

**Examples:**

``` text
Input: Hello123
Output: Strong Password

Input: hello
Output: Weak Password
```

## 9. Temperature Checker

**Problem:**

Write a Dart program that asks the user to enter the temperature in
Celsius.

Classify the temperature using the following conditions:

-   Below 0°C: `Freezing`
-   From 0°C to 15°C: `Cold`
-   From 16°C to 25°C: `Moderate`
-   From 26°C to 35°C: `Warm`
-   Above 35°C: `Hot`

Display the appropriate classification.

**Example:**

``` text
Input: 30
Output: Warm
```

## 10. Triangle Validator

**Problem:**

Write a Dart program that asks the user to enter the lengths of three
sides of a triangle.

Determine whether these three lengths can form a valid triangle.

A triangle is valid if:

-   All three sides are greater than zero.
-   The sum of any two sides must be greater than the third side.

If the sides form a valid triangle, display `Valid Triangle`.

Otherwise, display `Invalid Triangle`.

**Example:**

``` text
Input:
3
4
5

Output: Valid Triangle
```

## 11. Divisibility Checker

**Problem:**

Write a Dart program that asks the user to enter two integers: a number
and a divisor.

Determine whether the first number is divisible by the second number
without leaving a remainder.

If it is divisible, display `Divisible`.

Otherwise, display `Not Divisible`.

Make sure to handle the case where the divisor is zero.

**Example:**

``` text
Input:
20
5

Output: Divisible
```

## 12. Discount Calculator

**Problem:**

Write a Dart program that asks the user to enter the total purchase
amount.

Calculate the discount based on the following rules:

  Purchase Amount        Discount
  ----------------- -------------
  Less than 50        No discount
  50--99.99                    5%
  100--199.99                 10%
  200 or above                15%

Calculate and display:

-   Original purchase amount.
-   Discount percentage.
-   Discount amount.
-   Final amount after applying the discount.

If the purchase amount is negative, display `Invalid Amount`.

**Example:**

``` text
Input: 150

Output:
Original Amount: 150
Discount: 10%
Discount Amount: 15
Final Amount: 135
```
## 13. Login Validator

**Problem:**

Write a Dart program that asks the user to enter a username and
password.

Assume the correct credentials are:

``` text
Username: admin
Password: admin123
```

Check the entered credentials and display the appropriate message:

-   If both username and password are correct, display
    `Login Successful`.
-   If the username is incorrect, display `Incorrect Username`.
-   If the password is incorrect, display `Incorrect Password`.
-   If both are incorrect, display `Invalid Credentials`.

**Example:**

``` text
Input:
Username: admin
Password: admin123

Output: Login Successful
```

## 14. Shipping Cost Calculator

**Problem:**

Write a Dart program that asks the user to enter the destination region
and the weight of the package in kilograms.

Calculate the shipping cost based on the following rules:

  Region            Shipping Cost per kg
  --------------- ----------------------
  Local                             2 JD
  Nearby                            4 JD
  International                     8 JD

The total shipping cost is calculated by multiplying the package weight
by the shipping rate.

If the region is not recognized, display `Invalid Region`.

If the package weight is zero or negative, display `Invalid Weight`.

**Example:**

``` text
Input:
Region: Local
Weight: 3

Output:
Shipping Cost: 6 JD
```
