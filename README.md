# Архитектура вычислительных систем, задание 1 (13.09.2020)
Консольные программы на Ассемблере (FASM)
<h2/> 1. Console Calculator </h2>
(source: https://github.com/Nimtar/ConsoleCalculator)  
Программа выполняет простейшие арифметические операции над двумя целыми числами: сложение, вычитание, умножение и деление.
<h3/> Скриншот результата сложения </h3>
<img src= "https://github.com/MSenso/Computer-System-Architecture-task-1/blob/master/%2B%20operation.png">
<h3/> Скриншот результата вычитания </h3>
<img src= "https://github.com/MSenso/Computer-System-Architecture-task-1/blob/master/-%20operation.png">
<h3/> Скриншот результата умножения </h3>
<img src= "https://github.com/MSenso/Computer-System-Architecture-task-1/blob/master/multipl_operation.png">
<h3/> Скриншот результата деления </h3>
<img src= "https://github.com/MSenso/Computer-System-Architecture-task-1/blob/master/div_operation.png">
<h3/> Скриншот результата попытки деления на ноль </h3>
<img src= "https://github.com/MSenso/Computer-System-Architecture-task-1/blob/master/zero_divison.png">
<h3/> Скриншот результата попытки деления отрицательного и положительного чисел </h3>
<img src= "https://github.com/MSenso/Computer-System-Architecture-task-1/blob/master/wrong_div_operation.png">
           Данная операция работает некорректно.
<h3/> Скриншот результата попытки ввода вещественного числа </h3>
<img src= "https://github.com/MSenso/Computer-System-Architecture-task-1/blob/master/float_wrong.png">
           Данная операция работает некорректно.
           
<h2/> 2. Console Game </h2>
(source: https://guidedhacking.com/threads/fasm-simple-console-game.9576/)  
Программа предлагает пользователю отгадать случайное число. Если загаданное число больше введенного, на экран выводится "It's more!", если меньше, то "It's less!".
<h3/> Скриншот игрового процесса </h3>
<img src= "https://github.com/MSenso/Computer-System-Architecture-task-1/blob/master/game%20proc.png">
           Когда пользователь угадывает число, программа закрывается.

<h2/> 3. Console Hello Program </h2> 
(source: https://otvet.mail.ru/question/99481205)  
Программа принимает на вход две строки: имя и фамилию пользователя. После чего на экран выводится строка вида "Hello, <Name> <Surname>!", где Name – первая введенная строка (имя), Surname – вторая введенная строка (фамилия).
           <h3/> Скриншот результата работы программы </h3>
           <img src = "https://github.com/MSenso/Computer-System-Architecture-task-1/blob/master/hello.png">
           <h3/> Скриншот результата работы программы при вводе строк, содержащих не только буквенные символы</h3>
           <img src = "https://github.com/MSenso/Computer-System-Architecture-task-1/blob/master/symb%20hello.png">
            Как можно увидеть на скриншоте выше, программе на вход можно подавать строку из любых символов, а не только буквенных.
            
<h2/> 4. Console Hello World </h2> 
(source: https://habr.com/ru/post/257551/)  
Программа выводит на экран одну строку: "Hello, world!"
<h3/> Скриншот результата работы программы </h3>
<img src= "https://github.com/MSenso/Computer-System-Architecture-task-1/blob/master/hello%20world.png">

<h2/> 5. Console Sum </h2> 
(source: https://studassistent.ru/assembler/a-b-v-assemblere-fasm-vvod-s-klaviatury-i-vyvod-na-ekran-assembler)  
Программе подается на вход два числа, после чего на экран выводится сумма введенных чисел и через пять секунд программа закрывается.
<h3/> Скриншот результата сложения двух положительных чисел </h3>
<img src = "https://github.com/MSenso/Computer-System-Architecture-task-1/blob/master/default%20sum.png">
<h3/> Скриншот результата сложения двух отрицательных чисел </h3>
<img src = "https://github.com/MSenso/Computer-System-Architecture-task-1/blob/master/-sum.png">
<h3/> Скриншот результата попытки ввести первым вещественное число </h3>
<img src = "https://github.com/MSenso/Computer-System-Architecture-task-1/blob/master/first_float.png">
Результат некорректный.
<h3/> Скриншот результата попытки ввести вторым вещественное число </h3>
<img src = "https://github.com/MSenso/Computer-System-Architecture-task-1/blob/master/second_float.png">
Результат некорректный.
