# enigma
enigma cypher

![enigma](https://thumbs.gfycat.com/GlaringDamagedKittiwake-size_restricted.gif)

This enigma cipher program will encrypt any length of message by shifting letters based on four seperate keys. In addition, this program will allow you to decode the message and crack it if necessary. 

To run this program, in you CLI interface just run ruby on the encrypt.rb with two file locations of the message you want to crack and where you want to save it. If you want to decrypt the message, just run decrypt from the CLI with the parameters encrypted file location, file name of location you want to save decrypted message and the corersponding key (last parameter date is optional). Cracking an encryption utilizes a brute force method which doesnt require any input except for what the encrypted file method name is and where you want to save the decrypted text. If the date is not filled out, than the date will be set to today. 


Examples below:

ruby lib/encrypt.rb message.txt encrypted.txt

ruby lib/decrypt.rb encrypted.txt decrypted.txt <key> <date = optional>
 
ruby lib/crack.rb encrypted.txt cracked.txt <date = optional>


Self grading rubric:


Functionality - program follows interaction pattern and successfully encrypts/decrypts/cracks from the CLI interface. Brute force method produced another key that was applicable in decoding the interaction pattern message (same shift parameters, documented in enigma test) but I have found no issues with the solution. "3.8"

Object Oriented Programming - Project has been broken down into what I believe are logical compenents and are properly encasulated. No class is too little and specific to job. All classes handle specific functionality. No use of modules or inheritance. "3"

Ruby Conventions and Mechanics - All code is properly indented, naming conventions are clear and communicate purpose (as far as I know). All enumerables were chosen as best fit answers to solve a particular problem, However I am sure there are others that may be in mind. Only 1 method is 12 lines due to the return value hash length and was left that way for readibility. "3.5"

Test Driven Development - Every Method has been tested in multiple ways to account for multiple possiblities and outcomes. Commits show test were created before wrighting code. Four stubs were utilized in tests to test functionality but is limited in scope. "3"

Version Control - 50+ commits were implemented and most pull requests included logical chunks of functionality. All pull requests are clearly and concisely documents for purpose of pull request. No more than 3 commits included multiple pieces of functionality, but during refactoring, multiple lines of code were moved inbetween commits. "3"

