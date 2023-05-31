package com.silverest.part1as

object Recap:
    val aCondition: Boolean = false
    val anIfExpression: Int = if (aCondition) 42 else 55

    val aCodeBlock = 
        if (aCondition) 54
        78

    // Unit == Void
    val theUnit = println("Hello, scala")

    // functions
    def aFunction(x: Int): Int = x + 1

    
    def factorial(n: Int, acc: Int = 1): Int =
        if (n <= 0) acc
        else factorial(n - 1, n * acc)

    val fact10 = factorial(10)

    @main def run(): Unit =
      theUnit

