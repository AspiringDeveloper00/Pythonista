-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pythonista
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chapters`
--

DROP TABLE IF EXISTS `chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapters` (
  `id` int NOT NULL,
  `chapter_name` varchar(45) NOT NULL,
  PRIMARY KEY (`chapter_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapters`
--

LOCK TABLES `chapters` WRITE;
/*!40000 ALTER TABLE `chapters` DISABLE KEYS */;
INSERT INTO `chapters` VALUES (9,'AdvancedTest'),(5,'BasicsTest'),(2,'Chapter1'),(3,'Chapter2'),(4,'Chapter3'),(6,'Chapter4'),(7,'Chapter5'),(8,'Chapter6'),(10,'Chapter7'),(11,'Chapter8'),(12,'Chapter9'),(13,'ExpertTest'),(1,'Quickstart');
/*!40000 ALTER TABLE `chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapters_users_info`
--

DROP TABLE IF EXISTS `chapters_users_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapters_users_info` (
  `user_id` int NOT NULL,
  `chapter_name` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`,`chapter_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapters_users_info`
--

LOCK TABLES `chapters_users_info` WRITE;
/*!40000 ALTER TABLE `chapters_users_info` DISABLE KEYS */;
INSERT INTO `chapters_users_info` VALUES (3,'Quickstart');
/*!40000 ALTER TABLE `chapters_users_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests` (
  `id` int NOT NULL,
  `test_name` varchar(45) NOT NULL,
  PRIMARY KEY (`test_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (9,'AdvancedTest_test'),(5,'BasicsTest_test'),(2,'Chapter1_test'),(3,'Chapter2_test'),(4,'Chapter3_test'),(6,'Chapter4_test'),(7,'Chapter5_test'),(8,'Chapter6_test'),(10,'Chapter7_test'),(11,'Chapter8_test'),(12,'Chapter9_test'),(13,'ExpertTest_test'),(1,'Quickstart_test');
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_questions`
--

DROP TABLE IF EXISTS `tests_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_questions` (
  `test_name` varchar(100) NOT NULL,
  `question_type` varchar(20) NOT NULL,
  `question` varchar(300) NOT NULL,
  `right_answer` varchar(100) NOT NULL,
  `multiple1` varchar(100) DEFAULT NULL,
  `multiple2` varchar(100) DEFAULT NULL,
  `multiple3` varchar(100) DEFAULT NULL,
  `multiple4` varchar(100) DEFAULT NULL,
  `chapter_name` varchar(45) NOT NULL,
  `subchapter` varchar(100) NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_questions`
--

LOCK TABLES `tests_questions` WRITE;
/*!40000 ALTER TABLE `tests_questions` DISABLE KEYS */;
INSERT INTO `tests_questions` VALUES ('Chapter8_test','mul',' If you for some reason have a class definition with no content, then which statement should you put?','pass','pass','empty','continue','','Chapter8','Classes'),('Chapter7_test','rw','A lambda function can take any number of arguments, and have many expressions','wrong','','','','','Chapter7','Lamdas'),('Chapter4_test','rw','A list can contain different data type.','right','','','','','Chapter4','Lists'),('ExpertTest_test','mul','Add 10 to argument a, and return the result:','x = lambda a : a + 10','x = lambda a : a + 10','x = lambda a : 10','x = lambda a,10 : a + 10','','Chapter7','Lamdas'),('Chapter2_test','rw','Almost any value is evaluated to True if it has some sort of content.','right','','','','','Chapter2','Booleans'),('ExpertTest_test','mul','Create a lambda function that takes one parameter (a) and returns it.','x = lambda a : a','x = lambda a : a','x = lamda a : a','x = labmda a : a ','','Chapter7','Lamdas'),('ExpertTest_test','mul','Create an object of MyClass called p1:\r\nclass MyClass:\r\n  x = 5','p1 = MyClass()','p1 = MyClass()','p1.MyClass()','MyClass() = p1','','Chapter8','Classes'),('ExpertTest_test','gap','Fill the gap . Execute a function named my_function.\r\ndef my_function():\r\n  print(\"Hello from a function\")\r\n________________','my_function()','','','','','Chapter7','Functions'),('BasicsTest_test','gap','Fill the gap (if the previous conditions were not true, then try this condition)\r\na = 33\r\nb = 33\r\nif b > a:\r\n  print(\"b is greater than a\")\r\n____ a == b:\r\n  print(\"a and b are equal\")','elif','','','','','Chapter3','Conditions'),('BasicsTest_test','gap','Fill the gap (this catches anything which isn\'t caught by the preceding conditions.)\r\na = 200\r\nb = 33\r\nif b > a:\r\n  print(\"b is greater than a\")\r\nelif a == b:\r\n  print(\"a and b are equal\")\r\n_____\r\n  print(\"a is greater than b\")','else','','','','','Chapter3','Conditions'),('BasicsTest_test','gap','Fill the gap, given that its a nested if\r\nif x > 10:\r\n  print(\"Above ten,\")\r\n  ___ x > 20:\r\n    print(\"and also above 20!\")\r\n  else:\r\n    print(\"but not above 20.\")','if','','','','','Chapter3','Conditions'),('ExpertTest_test','gap','Fill the gap. Create a class named MyClass:\r\n_______ MyClass:\r\n   x = 5','class','','','','','Chapter8','Classes'),('AdvancedTest_test','gap','Fill the gap. Exit the loop when x is \"banana\". \r\nfruits = [\"apple\", \"banana\", \"cherry\"]\r\nfor x in fruits:\r\n  if x == \"banana\":\r\n     _______\r\n  print(x)','break','','','','','Chapter5','For loops'),('AdvancedTest_test','gap','Fill the gap. Print a message once the condition is false.\r\ni = 1\r\nwhile i < 6:\r\n  print(i)\r\n  i += 1\r\n  _______\r\n  print(\"i is no longer less than 6\")','else:','','','','','Chapter6','While loops'),('AdvancedTest_test','gap','Fill the gap. Print the number of items in the list.\r\nfruits = [\"apple\", \"banana\", \"cherry\"]\r\nprint(______)','len(fruits)','','','','','Chapter4','Lists'),('AdvancedTest_test','gap','Fill the gap. Print the second item in the fruits list. \r\nfruits = [\"apple\", \"banana\", \"cherry\"]\r\nprint(_____)','fruits[1]','','','','','Chapter4','Lists'),('AdvancedTest_test','gap','Fill the gap. Stop the loop if i is 3.\r\ni = 1\r\nwhile i < 6:\r\n  if i == 3:\r\n    ______\r\n  i += 1\r\n','break','','','','','Chapter6','While loops'),('AdvancedTest_test','gap','Fill the gap. Use the append method to add \"orange\" to the fruits list:\r\nfruits = [\"apple\", \"banana\", \"cherry\"]','fruits.append(\"orange\")','','','','','Chapter4','Lists'),('ExpertTest_test','gap','Fill the gap. What is the correct syntax to create a class named Student that will inherit properties and methods from a class named Person?\r\nclass __________:','Students(Person)','','','','','Chapter9','Inheritance'),('BasicsTest_test','gap','Get the characters from position 2, and all the way to the end from the string txt=\"Hello World\" ?\r\nWrite your answer like this (txt[..])\r\n','txt[2:]','','','','','Chapter2','Strings'),('Quickstart_test','mul','hen you are done in the python command line, you can simply type this and exit.','Exit()','Exit()','Exit ','Exit() python','','Quickstart','Quickstart'),('BasicsTest_test','mul','How can i be sure that the variable x will be 3.0?','x = float(3)','x = str(3)','x = int(3)','x = float(3)','','Chapter1','Data types'),('Chapter3_test','gap','If statements inside if statements, are called ____ if statements ','nested','','','','','Chapter3','Conditions'),('Chapter9_test','mul','If you add a method in the child class with the same name as a function in the parent class,','the inheritance of the parent method will be overridden.','the inheritance of the parent method will be overridden.','the inheritance of the parent method won\'t be overridden.','','','Chapter9','Inheritance'),('Chapter4_test','gap','If you do not specify the index, the ___ method removes the last item.','pop()','','','','','Chapter4','Lists'),('Chapter7_test','mul','if your function expects 2 arguments, you have to call the function with how many arguments?','only 2 ','only 2 ','1 or 2','2 or more','','Chapter7','Functions'),('AdvancedTest_test','gap','In the loop, when i is 3, jump directly to the next iteration.\r\ni = 0\r\nwhile i < 6:\r\n  i += 1\r\n  if i == 3:\r\n    _______\r\n  print(i)','continue','','','','','Chapter6','While loops'),('ExpertTest_test','gap','Inside a function with two parameters, print the first parameter.\r\ndef my_function(fname, lname):\r\n  print(____)','fname','','','','','Chapter7','Functions'),('BasicsTest_test','mul','Is the variable _4var legal?','Yes because it starts with _','Yes because it starts with _','No because it starts with _','No because after _ there is number 4.','','Chapter1','Variables'),('Quickstart_test','rw','It\'s not necessary to use the same number of spaces in the same block of code.\r\n','wrong','','','','','Quickstart','Quickstart'),('AdvancedTest_test','mul','Loop through the items in the fruits list, fruits = [\"apple\", \"banana\", \"cherry\"].Choose the right answer:\r\n','for x in fruits:','for x on fruits:','for x in fruits:','for x: for fruits:','','Chapter5','For loops'),('Chapter8_test','rw','Objects cannot  contain methods','wrong','','','','','Chapter8','Classes'),('Chapter9_test','gap','Parent class is the class being inherited from, also called base class.\r\n____ class is the class that inherits from another class, also called derived class\r\n','Child','','','','','Chapter9','Inheritance'),('BasicsTest_test','gap','Print \"Hello\" if a is equal to b, or c is equal to d. Fill the gap.\r\nif a == b ___ c == d:\r\n  print(\"Hello\")','or','','','','','Chapter2','Strings'),('Chapter9_test','gap','Python also has a ____function that will make the child class inherit all the methods and properties from its parent\r\n','super()','','','','','Chapter9','Inheritance'),('Quickstart_test','rw','Python is an interpreted programming language','right','','','','','Quickstart','Quickstart'),('Chapter5_test','mul','Range(2,6) means:','values from 2 to 5','values from 3 to 6','values from 2 to 6','values from 2 to 5','','Chapter5','For loops'),('Chapter5_test','rw','Range(6) is the values of 0 to 6 ','wrong','','','','','Chapter5','For loops'),('Quickstart_test','rw','Someone can enter the python command line just by typping python in the command line, if python is downloaded in the pc.\r\n','right','','','','','Quickstart','Quickstart'),('BasicsTest_test','gap','Split the string txt=\"Hello, Word\" with the right method.','txt.split(,)','','','','','Chapter2','Strings'),('Chapter1_test','gap','The ____ operator returns True if both statements are true.','and','','','','','Chapter1','Operators'),('Chapter2_test','gap','The _____ method takes the passed arguments, formats them, and places them in the string where the placeholders {} are.','format()','','','','','Chapter2','Strings'),('Chapter5_test','rw','The \"inner loop\" will be executed one time for each iteration of the \"outer loop\"','right','','','','','Chapter5','For loops'),('Chapter1_test','rw','The == operator is logical.','wrong','','','','','Chapter1','Operators'),('Chapter9_test','rw','The child\'s __init__() function do not override the inheritance of the parent\'s __init__() function.','wrong','','','','','Chapter9','Inheritance'),('Chapter3_test','rw','The elif keyword catches anything which isn\'t caught by the preceding conditions','wrong','','','','','Chapter3','Conditions'),('Chapter4_test','rw','The first item of a list has index [1].','wrong','','','','','Chapter4','Lists'),('Chapter7_test','gap','The power of lambda is better shown when you use them as an ___ function inside another function.','anonymous','','','','','Chapter7','Lamdas'),('Chapter4_test','mul','To add an item to the end of the list which method we use? ','append()','append()','insert()','extend()','','Chapter4','Lists'),('Chapter7_test','rw','To call a function, use the function name followed by parenthesis.','right','','','','','Chapter7','Functions'),('Chapter9_test','rw','To create a class that inherits the functionality from another class, send the parent class as a parameter when creating the child class.','right','','','','','Chapter9','Inheritance'),('Chapter7_test','gap','To let a function return a value, use the ___ statement:','return','','','','','Chapter7','Functions'),('AdvancedTest_test','gap','Use a range of indexes to print the third, fourth, and fifth item in the list.\r\nfruits = [\"apple\", \"banana\", \"cherry\", \"orange\", \"kiwi\", \"melon\", \"mango\"]\r\nprint(fruits[___])','2:5','','','','','Chapter4','Lists'),('Chapter8_test','rw','Use the __init__() function to assign values to object properties, or other operations that are necessary to do when the object is being created','right','','','','','Chapter8','Classes'),('ExpertTest_test','gap','Use the p1 object to print the value of x:\r\nclass MyClass:\r\n  x = 5\r\n\r\np1 = MyClass()\r\nprint(___)','p1.x','','','','','Chapter8','Classes'),('AdvancedTest_test','gap','Use the range function to loop through a code set 6 times.Fill the gap \r\nfor x in ____:\r\n   print(x)\r\n ','range(6)','','','','','Chapter5','For loops'),('Chapter6_test','rw','We don\'t have to increment i inside the while loop.','wrong','','','','','Chapter6','While loops'),('Chapter6_test','rw','We need to define an indexing variable before we start the while loop','right','','','','','Chapter6','While loops'),('BasicsTest_test','mul','What characters are illegal in the variable name 4my-first_name ?','4 and -','4 and -','- and _','4 and _','','Chapter1','Variables'),('Chapter3_test','mul','What does this if statement tests?\r\nif a!=b or c<=a:\r\n\r\n','if a isn\'t equal to b or if c is less than or equal to b','if a isn\'t equal to b or if c is less than or equal to b','if a isn\'t equal to b or if c is less than and equal to b','if a is equal to b or if c is less than or equal to b','','Chapter3','Conditions'),('Chapter6_test','mul','What does while i <6 loop means?','as long as i is less than 6','as long as i is less than 6','as long as i is greater than 6','as long as i isn\'t less than 6','','Chapter6','While loops'),('ExpertTest_test','mul','What is the correct syntax to assign a \"init\" function to a class?','__init__','__init__','_init_','__init','','Chapter8','Classes'),('ExpertTest_test','gap','What is the correct syntax to execute the printname method of the object x?\r\nclass Person:\r\n  def __init__(self, fname):\r\n    self.firstname = fname\r\n  def printname(self):\r\n    print(self.firstname)\r\nclass Student(Person):\r\n  pass\r\n\r\nx = Student(\"Mike\")\r\n______________\r\n','x.printname()','','','','','Chapter9','Inheritance'),('Chapter1_test','mul','What is the result of this line of code: x=str(3)',' x will take the value \'3\'',' x will take the value \'3\'',' x will take the value 3',' x will take the value 3.0','','Chapter1','Data types'),('BasicsTest_test','gap','What misses so this can be a correct syntax?\r\nage = 36\r\ntxt = \"My name is John, and I am ___\"\r\nprint(txt.format(age))\r\n\r\n','{}','','','','','Chapter2','Strings'),('Quickstart_test','gap','Whenever you are done in the python command line, you can type ____ and quit the python command line interface','Exit()','','','','','Quickstart','Quickstart'),('Quickstart_test','mul','Which is the correct syntax for print in python?','print (\"Hello World\")','print \"Hello World\"','print (\"Hello World\")','print (Hello World)','','Quickstart','Quickstart'),('Chapter3_test','mul','Which keyword is pythons way of saying \"if the previous conditions were not true, then try this condition\".','elif','if','else','elif','','Chapter3','Conditions'),('Chapter2_test','mul','Which method removes any whitespace from the beginning or the end?\r\n','strip()','split()','strip()','remove()','','Chapter2','Strings'),('Chapter4_test','gap','Which method we use to insert a list item at a specified index?','insert()','','','','','Chapter4','Lists'),('Chapter8_test','mul','Which of the bellow is correct for creating an object p1 of a class named Myclass?','p1 = Myclass() ','p1 = Myclass() ','p1.Myclass()','Myclass(p1)','','Chapter8','Classes'),('Chapter2_test','mul','Which of the below lines of code print the characters from the start to position 4 (not included).','print(b[:4])','print(b[4:])','print(b[:4])','','','Chapter2','Strings'),('Chapter1_test','mul','Which of the variable name is illegal?\r\n','2name','2name','_2name','N_ame','','Chapter1','Variables'),('Chapter6_test','gap','With the ___ statement we can stop the loop even if the while condition is true.','break','','','','','Chapter6','While loops'),('Chapter5_test','gap','With the___ statement we can stop the loop before it has looped through all the items',' break','','','','','Chapter5','For loops'),('Quickstart_test','mul','With which extension do we save python files?','.py','.python','.py','.p','','Quickstart','Quickstart'),('Chapter6_test','mul','With which statement we can run a block of code once when the condition no longer is true?','else','else','elif','if','','Chapter6','While loops'),('Chapter5_test','mul','With which statement we can stop the current iteration of the loop, and continue with the next?','continue','break','continue','stop','','Chapter5','For loops'),('Chapter2_test','gap','You can convert from int to float with the ____ method.\r\n','float()','','','','','Chapter2','Numbers'),('Chapter8_test','gap','You can delete properties on objects by using the ___ keyword','del','','','','','Chapter8','Classes'),('Chapter3_test','rw','You can have if statements inside if statements','right','','','','','Chapter3','Conditions'),('Chapter1_test','rw','You cannot change a variables type.','wrong','','','','','Chapter1','Variables'),('Quickstart_test','rw','You dont have to use indetation in python.','wrong','','','','','Quickstart','Quickstart');
/*!40000 ALTER TABLE `tests_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_users_info`
--

DROP TABLE IF EXISTS `tests_users_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_users_info` (
  `user_id` int NOT NULL,
  `test_name` varchar(100) NOT NULL,
  `score` int DEFAULT NULL,
  PRIMARY KEY (`user_id`,`test_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_users_info`
--

LOCK TABLES `tests_users_info` WRITE;
/*!40000 ALTER TABLE `tests_users_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_users_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_info`
--

DROP TABLE IF EXISTS `users_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_info` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `salt` binary(32) NOT NULL,
  `email` varchar(254) NOT NULL,
  `age` int NOT NULL,
  `teacher` tinyint DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_info`
--

LOCK TABLES `users_info` WRITE;
/*!40000 ALTER TABLE `users_info` DISABLE KEYS */;
INSERT INTO `users_info` VALUES (2,'elena1234','fcd5ca02faa92138393ff718dda40daf943bf759f77b343a7b21aaea2ab8760c',_binary '����i�U\�\'�BgP?��_\�p�9�\r2\�K\�\�9�','example@domain.gr',21,1),(3,'antonis1234','65c4413dc30c6185e2c61c4ca9662609f909b669f362783400cb9f1eed260aca',_binary 'WxזBǢ\�f�z�\�gy�քFif\���\�\\��E','example@domain.com',22,NULL),(10,'kostas1234','3158ac5ea8007a21c07242da361e30a71a23ff24bf985a218d81c9760ff3c86f',_binary '>�J`\�n�>V\0Y\�#���	ͷmn�=�4Յ~=$','example@domain.it',53,NULL);
/*!40000 ALTER TABLE `users_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-01 19:07:23
