-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pythonista
-- ------------------------------------------------------
-- Server version	8.0.27

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
INSERT INTO `chapters_users_info` VALUES (3,'AdvancedTest'),(3,'BasicsTest'),(3,'Chapter1'),(3,'Chapter2'),(3,'Chapter3'),(3,'Chapter4'),(3,'Chapter5'),(3,'Chapter6'),(3,'Quickstart'),(11,'BasicsTest'),(11,'Chapter1'),(11,'Chapter2'),(11,'Chapter3'),(11,'Quickstart'),(12,'AdvancedTest'),(12,'BasicsTest'),(12,'Chapter1'),(12,'Chapter2'),(12,'Chapter3'),(12,'Chapter4'),(12,'Chapter5'),(12,'Chapter6'),(12,'Quickstart'),(14,'BasicsTest'),(14,'Chapter1'),(14,'Chapter2'),(14,'Chapter3'),(14,'Quickstart'),(15,'Quickstart'),(16,'Quickstart'),(17,'BasicsTest'),(17,'Chapter1'),(17,'Chapter2'),(17,'Chapter3'),(17,'Quickstart'),(18,'Quickstart');
/*!40000 ALTER TABLE `chapters_users_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level_test`
--

DROP TABLE IF EXISTS `level_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `level_test` (
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
  `test_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_test`
--

LOCK TABLES `level_test` WRITE;
/*!40000 ALTER TABLE `level_test` DISABLE KEYS */;
INSERT INTO `level_test` VALUES ('AdvancedTest_test','mul','Loop through the items in the fruits list, fruits = [\"apple\", \"banana\", \"cherry\"].Choose the right answer:\r','for x in fruits:','for x on fruits:','for x in fruits:','for x: for fruits:','','Chapter5','For loops',1),('BasicsTest_test','gap','Print \"Hello\" if a is equal to b, or c is equal to d. Fill the gap. if a == b ___ c == d: print(\"Hello\")','or','','','','','Chapter2','Strings',2),('BasicsTest_test','gap','Split the string txt=\"Hello, Word\" with the right method.','txt.split(,)','','','','','Chapter2','Strings',3),('AdvancedTest_test','gap','Use a range of indexes to print the third, fourth, and fifth item in the list.\r\nfruits = [\"apple\", \"banana\", \"cherry\", \"orange\", \"kiwi\", \"melon\", \"mango\"]\r\nprint(fruits[___])','2:5','','','','','Chapter4','Lists',4),('ExpertTest_test','gap','Use the p1 object to print the value of x:\r\nclass MyClass:\r\n  x = 5\r\n\r\np1 = MyClass()\r\nprint(___)','p1.x','','','','','Chapter8','Classes',5),('AdvancedTest_test','gap','Use the range function to loop through a code set 6 times.Fill the gap \r for x in ____:\r    print(x)\r','range(6)','','','','','Chapter5','For loops',6),('BasicsTest_test','mul','What characters are illegal in the variable name 4my-first_name ?','4 and -','4 and -','- and _','4 and _','','Chapter1','Variables',7),('ExpertTest_test','mul','What is the correct syntax to assign a \"init\" function to a class?','__init__','__init__','_init_','__init','','Chapter8','Classes',8),('ExpertTest_test','gap','What is the correct syntax to execute the printname method of the object x?\r\nclass Person:\r\n  def __init__(self, fname):\r\n    self.firstname = fname\r\n  def printname(self):\r\n    print(self.firstname)\r\nclass Student(Person):\r\n  pass\r\n\r\nx = Student(\"Mike\")\r\n______________\r\n','x.printname()','','','','','Chapter9','Inheritance',9),('BasicsTest_test','gap','What misses so this can be a correct syntax? age = 36 txt = \"My name is John, and I am ___\" print(txt.format(age))','{}','','','','','Chapter2','Strings',10);
/*!40000 ALTER TABLE `level_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `levels` (
  `user_id` int NOT NULL,
  `level_test` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (3,'finished'),(11,'cancel'),(12,'finished'),(13,'cancel'),(14,'cancel'),(15,'cancel'),(16,'cancel'),(17,'cancel'),(18,'finished');
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
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
  `test_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_questions`
--

LOCK TABLES `tests_questions` WRITE;
/*!40000 ALTER TABLE `tests_questions` DISABLE KEYS */;
INSERT INTO `tests_questions` VALUES ('Chapter8_test','mul',' If you for some reason have a class definition with no content, then which statement should you put?','pass','pass','empty','continue','','Chapter8','Classes',1),('Chapter7_test','rw','A lambda function can take any number of arguments, and have many expressions','wrong','','','','','Chapter7','Lamdas',2),('Chapter4_test','rw','A list can contain different data type.','right','','','','','Chapter4','Lists',3),('ExpertTest_test','mul','Add 10 to argument a, and return the result:','x = lambda a : a + 10','x = lambda a : a + 10','x = lambda a : 10','x = lambda a,10 : a + 10','','Chapter7','Lamdas',4),('Chapter2_test','rw','Almost any value is evaluated to True if it has some sort of content.','right','','','','','Chapter2','Booleans',5),('ExpertTest_test','mul','Create a lambda function that takes one parameter (a) and returns it.','x = lambda a : a','x = lambda a : a','x = lamda a : a','x = labmda a : a ','','Chapter7','Lamdas',6),('ExpertTest_test','mul','Create an object of MyClass called p1:\r\nclass MyClass:\r\n  x = 5','p1 = MyClass()','p1 = MyClass()','p1.MyClass()','MyClass() = p1','','Chapter8','Classes',7),('ExpertTest_test','gap','Fill the gap . Execute a function named my_function.\r\ndef my_function():\r\n  print(\"Hello from a function\")\r\n________________','my_function()','','','','','Chapter7','Functions',8),('BasicsTest_test','gap','Fill the gap (if the previous conditions were not true, then try this condition)\r\na = 33\r\nb = 33\r\nif b > a:\r\n  print(\"b is greater than a\")\r\n____ a == b:\r\n  print(\"a and b are equal\")','elif','','','','','Chapter3','Conditions',9),('BasicsTest_test','gap','Fill the gap (this catches anything which isn\'t caught by the preceding conditions.)\r\na = 200\r\nb = 33\r\nif b > a:\r\n  print(\"b is greater than a\")\r\nelif a == b:\r\n  print(\"a and b are equal\")\r\n_____\r\n  print(\"a is greater than b\")','else','','','','','Chapter3','Conditions',10),('BasicsTest_test','gap','Fill the gap, given that its a nested if\r\nif x > 10:\r\n  print(\"Above ten,\")\r\n  ___ x > 20:\r\n    print(\"and also above 20!\")\r\n  else:\r\n    print(\"but not above 20.\")','if','','','','','Chapter3','Conditions',11),('ExpertTest_test','gap','Fill the gap. Create a class named MyClass:\r\n_______ MyClass:\r\n   x = 5','class','','','','','Chapter8','Classes',12),('AdvancedTest_test','gap','Fill the gap. Exit the loop when x is \"banana\". \r\nfruits = [\"apple\", \"banana\", \"cherry\"]\r\nfor x in fruits:\r\n  if x == \"banana\":\r\n     _______\r\n  print(x)','break','','','','','Chapter5','For loops',13),('AdvancedTest_test','gap','Fill the gap. Print a message once the condition is false.\r\ni = 1\r\nwhile i < 6:\r\n  print(i)\r\n  i += 1\r\n  _______\r\n  print(\"i is no longer less than 6\")','else:','','','','','Chapter6','While loops',14),('AdvancedTest_test','gap','Fill the gap. Print the number of items in the list.\r\nfruits = [\"apple\", \"banana\", \"cherry\"]\r\nprint(______)','len(fruits)','','','','','Chapter4','Lists',15),('AdvancedTest_test','gap','Fill the gap. Print the second item in the fruits list. \r\nfruits = [\"apple\", \"banana\", \"cherry\"]\r\nprint(_____)','fruits[1]','','','','','Chapter4','Lists',16),('AdvancedTest_test','gap','Fill the gap. Stop the loop if i is 3.\r\ni = 1\r\nwhile i < 6:\r\n  if i == 3:\r\n    ______\r\n  i += 1\r\n','break','','','','','Chapter6','While loops',17),('AdvancedTest_test','gap','Fill the gap. Use the append method to add \"orange\" to the fruits list:\r\nfruits = [\"apple\", \"banana\", \"cherry\"]','fruits.append(\"orange\")','','','','','Chapter4','Lists',18),('ExpertTest_test','gap','Fill the gap. What is the correct syntax to create a class named Student that will inherit properties and methods from a class named Person?\r\nclass __________:','Students(Person)','','','','','Chapter9','Inheritance',19),('BasicsTest_test','gap','Get the characters from position 2, and all the way to the end from the string txt=\"Hello World\" ? Write your answer like this (txt[..])','txt[2:]','','','','','Chapter2','Strings',20),('BasicsTest_test','mul','How can i be sure that the variable x will be 3.0?','x = float(3)','x = str(3)','x = int(3)','x = float(3)','','Chapter1','Data types',21),('Chapter3_test','gap','If statements inside if statements, are called ____ if statements ','nested','','','','','Chapter3','Conditions',22),('Chapter9_test','mul','If you add a method in the child class with the same name as a function in the parent class,','the inheritance of the parent method will be overridden.','the inheritance of the parent method will be overridden.','the inheritance of the parent method won\'t be overridden.','','','Chapter9','Inheritance',23),('Chapter4_test','gap','If you do not specify the index, the ___ method removes the last item.','pop()','','','','','Chapter4','Lists',24),('Chapter7_test','mul','if your function expects 2 arguments, you have to call the function with how many arguments?','only 2 ','only 2 ','1 or 2','2 or more','','Chapter7','Functions',25),('AdvancedTest_test','gap','In the loop, when i is 3, jump directly to the next iteration.\r\ni = 0\r\nwhile i < 6:\r\n  i += 1\r\n  if i == 3:\r\n    _______\r\n  print(i)','continue','','','','','Chapter6','While loops',26),('ExpertTest_test','gap','Inside a function with two parameters, print the first parameter.\r\ndef my_function(fname, lname):\r\n  print(____)','fname','','','','','Chapter7','Functions',27),('BasicsTest_test','mul','Is the variable _4var legal?','Yes because it starts with _','Yes because it starts with _','No because it starts with _','No because after _ there is number 4.','','Chapter1','Variables',28),('AdvancedTest_test','mul','Loop through the items in the fruits list, fruits = [\"apple\", \"banana\", \"cherry\"].Choose the right answer:\r\n','for x in fruits:','for x on fruits:','for x in fruits:','for x: for fruits:','','Chapter5','For loops',29),('Chapter8_test','rw','Objects cannot  contain methods','wrong','','','','','Chapter8','Classes',30),('Chapter9_test','gap','Parent class is the class being inherited from, also called base class.\r\n____ class is the class that inherits from another class, also called derived class\r\n','Child','','','','','Chapter9','Inheritance',31),('BasicsTest_test','gap','Print \"Hello\" if a is equal to b, or c is equal to d. Fill the gap. if a == b ___ c == d: print(\"Hello\")','or','','','','','Chapter2','Strings',32),('Chapter9_test','gap','Python also has a ____function that will make the child class inherit all the methods and properties from its parent\r\n','super()','','','','','Chapter9','Inheritance',33),('Quickstart_test','gap','Python is an ___________  programming language','interpreted','','','','','Quickstart','Quickstart',34),('Chapter5_test','mul','Range(2,6) means:','values from 2 to 5','values from 3 to 6','values from 2 to 6','values from 2 to 5','','Chapter5','For loops',35),('Chapter5_test','rw','Range(6) is the values of 0 to 6 ','wrong','','','','','Chapter5','For loops',36),('Quickstart_test','rw','Someone can enter the python command line just by typping python in the command line, if python is downloaded in the pc.\r\n','right','','','','','Quickstart','Quickstart',37),('BasicsTest_test','gap','Split the string txt=\"Hello, Word\" with the right method.','txt.split(,)','','','','','Chapter2','Strings',38),('Chapter1_test','gap','The ____ operator returns True if both statements are true.','and','','','','','Chapter1','Operators',39),('Chapter2_test','gap','The _____ method takes the passed arguments, formats them, and places them in the string where the placeholders {} are.','format()','','','','','Chapter2','Strings',40),('Chapter5_test','rw','The \"inner loop\" will be executed one time for each iteration of the \"outer loop\"','right','','','','','Chapter5','For loops',41),('Chapter1_test','rw','The == operator is logical.','wrong','','','','','Chapter1','Operators',42),('Chapter9_test','rw','The child\'s __init__() function do not override the inheritance of the parent\'s __init__() function.','wrong','','','','','Chapter9','Inheritance',43),('Chapter3_test','rw','The elif keyword catches anything which isn\'t caught by the preceding conditions','wrong','','','','','Chapter3','Conditions',44),('Chapter4_test','rw','The first item of a list has index [1].','wrong','','','','','Chapter4','Lists',45),('Chapter7_test','gap','The power of lambda is better shown when you use them as an ___ function inside another function.','anonymous','','','','','Chapter7','Lamdas',46),('Chapter4_test','mul','To add an item to the end of the list which method we use? ','append()','append()','insert()','extend()','','Chapter4','Lists',47),('Chapter7_test','rw','To call a function, use the function name followed by parenthesis.','right','','','','','Chapter7','Functions',48),('Chapter9_test','rw','To create a class that inherits the functionality from another class, send the parent class as a parameter when creating the child class.','right','','','','','Chapter9','Inheritance',49),('Chapter7_test','gap','To let a function return a value, use the ___ statement:','return','','','','','Chapter7','Functions',50),('AdvancedTest_test','gap','Use a range of indexes to print the third, fourth, and fifth item in the list.\r\nfruits = [\"apple\", \"banana\", \"cherry\", \"orange\", \"kiwi\", \"melon\", \"mango\"]\r\nprint(fruits[___])','2:5','','','','','Chapter4','Lists',51),('Chapter8_test','rw','Use the __init__() function to assign values to object properties, or other operations that are necessary to do when the object is being created','right','','','','','Chapter8','Classes',52),('ExpertTest_test','gap','Use the p1 object to print the value of x:\r\nclass MyClass:\r\n  x = 5\r\n\r\np1 = MyClass()\r\nprint(___)','p1.x','','','','','Chapter8','Classes',53),('AdvancedTest_test','gap','Use the range function to loop through a code set 6 times.Fill the gap \r\nfor x in ____:\r\n   print(x)\r\n ','range(6)','','','','','Chapter5','For loops',54),('Chapter6_test','rw','We don\'t have to increment i inside the while loop.','wrong','','','','','Chapter6','While loops',55),('Chapter6_test','rw','We need to define an indexing variable before we start the while loop','right','','','','','Chapter6','While loops',56),('BasicsTest_test','mul','What characters are illegal in the variable name 4my-first_name ?','4 and -','4 and -','- and _','4 and _','','Chapter1','Variables',57),('Chapter3_test','mul','What does this if statement tests? if a!=b or c<=b:','if a isn\'t equal to b or if c is less than or equal to b','if a isn\'t equal to b or if c is less than or equal to b','if a isn\'t equal to b or if c is less than and equal to b','if a is equal to b or if c is less than or equal to b','','Chapter3','Conditions',58),('Chapter6_test','mul','What does while i <6 loop means?','as long as i is less than 6','as long as i is less than 6','as long as i is greater than 6','as long as i isn\'t less than 6','','Chapter6','While loops',59),('ExpertTest_test','mul','What is the correct syntax to assign a \"init\" function to a class?','__init__','__init__','_init_','__init','','Chapter8','Classes',60),('ExpertTest_test','gap','What is the correct syntax to execute the printname method of the object x?\r\nclass Person:\r\n  def __init__(self, fname):\r\n    self.firstname = fname\r\n  def printname(self):\r\n    print(self.firstname)\r\nclass Student(Person):\r\n  pass\r\n\r\nx = Student(\"Mike\")\r\n______________\r\n','x.printname()','','','','','Chapter9','Inheritance',61),('Chapter1_test','mul','What is the result of this line of code: x=str(3)',' x will take the value \'3\'',' x will take the value \'3\'',' x will take the value 3',' x will take the value 3.0','','Chapter1','Data types',62),('BasicsTest_test','gap','What misses so this can be a correct syntax? age = 36 txt = \"My name is John, and I am ___\" print(txt.format(age))','{}','','','','','Chapter2','Strings',63),('Quickstart_test','gap','Whenever you are done in the python command line, you can type ____ and quit the python command line interface','Exit()','','','','','Quickstart','Quickstart',64),('Quickstart_test','mul','Which is the correct syntax for print in python?','print (\"Hello World\")','print \"Hello World\"','print (\"Hello World\")','print (Hello World)','','Quickstart','Quickstart',65),('Chapter3_test','mul','Which keyword is pythons way of saying \"if the previous conditions were not true, then try this condition\".','elif','if','else','elif','','Chapter3','Conditions',66),('Chapter2_test','mul','Which method removes any whitespace from the beginning or the end?\r\n','strip()','split()','strip()','remove()','','Chapter2','Strings',67),('Chapter4_test','gap','Which method we use to insert a list item at a specified index?','insert()','','','','','Chapter4','Lists',68),('Chapter8_test','mul','Which of the bellow is correct for creating an object p1 of a class named Myclass?','p1 = Myclass() ','p1 = Myclass() ','p1.Myclass()','Myclass(p1)','','Chapter8','Classes',69),('Chapter2_test','mul','Which of the below lines of code print the characters from the start to position 4 (not included).','print(b[:4])','print(b[4:])','print(b[:4])','','','Chapter2','Strings',70),('Chapter1_test','mul','Which of the variable name is illegal?\r\n','2name','2name','_2name','N_ame','','Chapter1','Variables',71),('Chapter6_test','gap','With the ___ statement we can stop the loop even if the while condition is true.','break','','','','','Chapter6','While loops',72),('Chapter5_test','gap','With the___ statement we can stop the loop before it has looped through all the items',' break','','','','','Chapter5','For loops',73),('Quickstart_test','mul','With which extension do we save python files?','.py','.python','.py','.p','','Quickstart','Quickstart',74),('Chapter6_test','mul','With which statement we can run a block of code once when the condition no longer is true?','else','else','elif','if','','Chapter6','While loops',75),('Chapter5_test','mul','With which statement we can stop the current iteration of the loop, and continue with the next?','continue','break','continue','stop','','Chapter5','For loops',76),('Chapter2_test','gap','You can convert from int to float with the ____ method.\r\n','float()','','','','','Chapter2','Numbers',77),('Chapter8_test','gap','You can delete properties on objects by using the ___ keyword','del','','','','','Chapter8','Classes',78),('Chapter3_test','rw','You can have if statements inside if statements','right','','','','','Chapter3','Conditions',79),('Chapter1_test','rw','You cannot change a variables type.','wrong','','','','','Chapter1','Variables',80),('Quickstart_test','rw','You dont have to use indetation in python.','wrong','','','','','Quickstart','Quickstart',81);
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
INSERT INTO `tests_users_info` VALUES (3,'BasicsTest_test',100),(3,'Chapter1_test',100),(3,'Chapter2_test',100),(3,'Chapter3_test',100),(3,'Chapter4_test',100),(3,'Chapter5_test',100),(3,'Chapter6_test',100),(3,'Quickstart_test',100),(11,'Chapter1_test',67),(11,'Chapter2_test',100),(11,'Chapter3_test',100),(11,'Quickstart_test',67),(12,'AdvancedTest_test',100),(12,'BasicsTest_test',100),(12,'Chapter1_test',100),(12,'Chapter2_test',100),(12,'Chapter3_test',100),(12,'Chapter4_test',100),(12,'Chapter5_test',100),(12,'Chapter6_test',100),(12,'Quickstart_test',100),(14,'Chapter1_test',67),(14,'Chapter2_test',67),(14,'Chapter3_test',67),(14,'Quickstart_test',67),(15,'Quickstart_test',67),(17,'Chapter1_test',67),(17,'Chapter2_test',67),(17,'Chapter3_test',100),(17,'Quickstart_test',100);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_info`
--

LOCK TABLES `users_info` WRITE;
/*!40000 ALTER TABLE `users_info` DISABLE KEYS */;
INSERT INTO `users_info` VALUES (2,'elena1234','fcd5ca02faa92138393ff718dda40daf943bf759f77b343a7b21aaea2ab8760c',_binary 'ó∏ü£i§U\¬\'ÑBgP?¢ç_\Õp£9Ñ\r2\ÓK\ÿ\÷9õ','example@domain.gr',21,1),(3,'antonis1234','65c4413dc30c6185e2c61c4ca9662609f909b669f362783400cb9f1eed260aca',_binary 'Wx◊ñB«¢\÷f˜z™\Ìgyñ÷ÑFif\ÎÚ\È\\∏¡E','example@domain.com',22,NULL),(10,'kostas1234','3158ac5ea8007a21c07242da361e30a71a23ff24bf985a218d81c9760ff3c86f',_binary '>öJ`\∆ná>V\0Y\œ#∫Ö•	Õ∑mnù=Ú4’Ö~=$','example@domain.it',53,NULL),(11,'Antonis ','7405f15f8dc9dbf32e0d19358c78c5235d6d2d33093bf1a6a19db4af758f6889',_binary '\“iùLmè∫¯Ú+\Ÿ\ŸA´\ﬁr\ﬂ\n\«\ŒGq°','grand1925@yahoo.gr',22,NULL),(12,'antoniskarn','0ac4b8f13f2421d4640102497e6c8f24c69f955ef6570f4013ad693d7874ac21',_binary '\Ëª\ÃQ81\‰atÙ4ùé–úQl\È\Ì\Âó†\ƒ\‰~˙P','grantkarnavas@gmail.com',23,NULL),(13,'antonis12345','b7b7918fc5681772dde3b2e0df525cd1b2c843d8b6aeebc2cd23d47e05ed617b',_binary '8rí~ëä\‹‹§Gi\Íˇhª\÷\Èlë\0Ç`S#ı\Ó:L\·','grand5@yahoo.gr',22,NULL),(14,'elena12345','c697b50296c5507d0921d0458b1d565b2fe4a4069689f1032bcc00dcabbf7df9',_binary '\Í\ZíéSBÜOóÃë6™µy∑àÑ\0æÎõóDï∫f¸','grand19ae25@yahoo.gr',24,NULL),(15,'kostas12345','f56aba9c526bafb88e095559dd7f5af361eb81ee499b2494039472aa9d657e4c',_binary 'têLFÛè\ÈR<3≠§\rcru\Îxh%ú\‚\ ÿ¥2∆æC','grand1925@yahoo.com',53,NULL),(16,'admin1234','ca20af1cfd11b43dc8dd2ea036a9746eb839e29fae8860ba24a3fb4df34e968f',_binary '.\◊q©$‚ç£gn§≠S_1<ìani>©∏ô8\·®GÆî\À','gr925@yahoo.gr',23,NULL),(17,'admin123456','47c1de34d2cfa5e90a142d9d29182a00d143bed70bca49a3ab6bc93a6e75a23f',_binary 'G\Î\Ÿ.\—(Û∞ô{íS\Ô\ƒ#:+#¬≤\Ôû%\·∆¥Ω?¥-','gra55@yahoo.gr',22,NULL),(18,'nick12345','b104f5e386dd6c3c007d963043b3c8c9efae63faabf50d9ef346cbb55be1e013',_binary '_›ì\√?W¨\≈Nï£Z\„¥(1|%ZÚ4R\Â6úhìyG','nick12345@yahoo.gr',21,NULL);
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

-- Dump completed on 2022-07-03 18:40:11
