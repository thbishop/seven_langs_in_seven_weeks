def forLoop {
  println("for loop using java-style")
  for(i <- 0 until args.length) {
    println(args(i))
  }
}

forLoop
