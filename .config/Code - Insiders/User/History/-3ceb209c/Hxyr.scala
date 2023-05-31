package com.silverest.part1as

object Recap:
    val aCondition: Boolean = false
    val anIfExpression = if (aCondition) 42 else 55

    val aCodeBlock = 
        if (aCondition) 54  
        78
    
    val theUnit = println("Hello, scala")

    @main def run(): Unit = {
      theUnit
    }

