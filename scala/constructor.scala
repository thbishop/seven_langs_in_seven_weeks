class Person(first_name: String) {
  println("Outer constructor")

  def this(first_name: String, last_name: String) {
    this(first_name)
    println("Inner constructor")
  }

//  def this(first_name: String, last_name: String, gender: String) {
//    this(first_name)
//    #this(last_name)
 //   #this(gender_name)
//  }

//  def talk() = println("Hi" + first_name + " " + last_name +  " " + gender)

}

val bob = new Person("Bob")
bob.talk
val bobTate = new Person("Bob", "Tate")
bobTate.talk
val bobTateMale = new Person("Bob", "Tate", "male")
bobTateMale.talk
